import 'package:flutter/foundation.dart';

import '../../../../abstractservices/storage_services.dart';
import '../../../../core/services/storage_services/hive_keys.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repo.dart';
import '../datasource/user_remote_data_source.dart';
import '../model/user_model.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDataSource remoteDataSource;
  final StorageServices storageService;

  UserRepoImpl(this.remoteDataSource, this.storageService);

  @override
  Future<UserEntity> fetchUserProfile() async {
    try {
      final userModel = await remoteDataSource.fetchUserProfile();

      return userModel;
    } catch (e) {
      debugPrint("Error in Repository: $e");
      rethrow;
    }
  }

  @override
  UserEntity? getLocalUser() {
    final userJson = storageService.get(StorageKeys.user);
    if (userJson != null) {
      return UserModel.fromJson(Map<String, dynamic>.from(userJson));
    }
    return null;
  }
}
