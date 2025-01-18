// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../../core/services/get.dart';
// import '../../domain/entity/user_entity.dart';
// import '../../domain/usecase/user_profile_usecase.dart';

// class UserState {
//   final bool isLoading;
//   final String? error;
//   final UserEntity? user;

//   UserState({this.isLoading = false, this.error, this.user});
// }

// class UserStateNotifier extends StateNotifier<UserState> {
//   final GetLocalUserUseCase getLocalUser;
//   final GetUserProfileUseCase getUserProfile;

//   UserStateNotifier(this.getLocalUser, this.getUserProfile)
//       : super(UserState()) {
//     // _loadUser();
//   }

//   // Future<void> _loadUser() async {
//   //   state = state.copyWith(isLoading: true);
//   //   final localUser = getLocalUser.call();
//   //   if (localUser != null) {
//   //     state = state.copyWith(isLoading: false, user: localUser);
//   //   } else {
//   //     fetchUser();
//   //   }
//   // }

//   Future<void> fetchUser() async {
//     try {
//       final user = await getUserProfile.call();
//     } catch (e) {
//       Get.snackbar(e.toString());
//     }
//   }
// }

import 'package:easyhire_app/core/services/storage_services/hive_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../abstractservices/storage_services.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecase/user_profile_usecase.dart';

class UserNotifier extends StateNotifier<AsyncValue<UserEntity>> {
  final GetUserProfileUseCase getUserProfileUseCase;
  final StorageServices storageService;

  UserNotifier(this.getUserProfileUseCase, this.storageService)
      : super(const AsyncValue.loading()) {
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      final userProfile = await getUserProfileUseCase.call();
      debugPrint("User Profile Fetched: $userProfile");
      // storageService.set(StorageKeys.user, userProfile);
      state = AsyncValue.data(userProfile);
    } catch (e, stackTrace) {
      debugPrint("Error fetching user profile: $e");
      debugPrint("Stack Trace: $stackTrace");
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
