import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../abstractservices/storage_services.dart';
import '../../../../core/services/storage_services/hive_keys.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecase/user_profile_usecase.dart';

class UserStateNotifier extends StateNotifier<AsyncValue<UserEntity?>> {
  final GetLocalUserUseCase _getLocalUser;
  final GetUserProfileUseCase _getUserProfile;
  final StorageServices _storageService;

  UserStateNotifier(
    this._getUserProfile,
    this._storageService,
    this._getLocalUser,
  ) : super(const AsyncValue.loading());

  Future<void> loadUser() async {
    state = const AsyncValue.loading();
    try {
      final localUser = _getLocalUser();
      if (localUser != null) {
        state = AsyncValue.data(localUser);
      } else {
        await fetchUserProfile();
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString("eror"));
    }
  }

  Future<void> fetchUserProfile() async {
    state = const AsyncValue.loading();
    try {
      final userProfile = await _getUserProfile.call();
      await _storageService.set(StorageKeys.user, jsonEncode(userProfile));
      state = AsyncValue.data(userProfile);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString("error"));
      print('Error fetching user profile: $e');
    }
  }

  Future<void> clearUserProfile() async {
    try {
      await _storageService.remove(StorageKeys.user);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString("error"));
      print('Error clearing user profile: $e');
    }
  }
}
