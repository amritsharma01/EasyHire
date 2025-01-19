import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../abstractservices/storage_services.dart';
import '../../../../core/services/get.dart';
import '../../../../core/services/storage_services/hive_keys.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecase/user_profile_usecase.dart';

class UserState {
  final bool isLoading;
  final String? error;
  final UserEntity? user;

  UserState({this.isLoading = false, this.error, this.user});
}

class UserStateNotifier extends StateNotifier<UserState> {
  final GetLocalUserUseCase getLocalUser;
  final GetUserProfileUseCase getUserProfile;
  final StorageServices storageService;

  UserStateNotifier(this.getUserProfile, this.storageService, this.getLocalUser)
      : super(UserState());

  Future<void> loadUser() async {
    final localUser = getLocalUser.call();
    if (localUser != null) {
      state = UserState(isLoading: false, user: localUser);
    } else {
      fetchUserProfile();
    }
  }

  Future fetchUserProfile() async {
    try {
      final userProfile = await getUserProfile.call();
      await storageService.set(StorageKeys.user, jsonEncode(userProfile));
      state = UserState(isLoading: false, user: userProfile);
    } catch (e) {
      print("No user Profile");
    }
  }

  Future<void> clearUserProfile() async {
    await storageService.remove(StorageKeys.user);
    state = UserState(user: null);
  }
}

// import 'dart:convert';

// import 'package:easyhire_app/core/services/storage_services/hive_keys.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../abstractservices/storage_services.dart';
// import '../../../../core/services/get.dart';
// import '../../domain/entity/user_entity.dart';
// import '../../domain/usecase/user_profile_usecase.dart';

// class UserNotifier extends StateNotifier<AsyncValue<UserEntity>> {
//   final GetUserProfileUseCase getUserProfileUseCase;
//   final StorageServices storageService;

//   UserNotifier(this.getUserProfileUseCase, this.storageService)
//       : super(AsyncValue.loading()) {
//     fetchUserProfile();
//   }

//   Future<void> fetchUserProfile() async {
//     try {
//       final userProfile = await getUserProfileUseCase.call();
//       debugPrint("User Profile Fetched: $userProfile");
//       storageService.set(StorageKeys.user, jsonEncode(userProfile));
//       state = AsyncValue.data(userProfile);
//     } catch (e) {
//       Get.snackbar("Unable to fetch profile");
//     }
//   }

//   Future<void> clearUserProfile() async {
//     await storageService.remove(StorageKeys.user);

//     debugPrint("User profile cleared");
//   }
// }
