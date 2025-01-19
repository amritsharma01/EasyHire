import 'package:easyhire_app/features/user/data/datasource/user_local_data_source.dart';
import 'package:flutter/foundation.dart';

import '../../../../abstractservices/storage_services.dart';

import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repo.dart';
import '../datasource/user_remote_data_source.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDatasource;

  UserRepoImpl(this.remoteDataSource, this.localDatasource);

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
    try {
      final userModel = localDatasource.getLocalUser();

      return userModel;
    } catch (e) {
      debugPrint("Error in Repository: $e");
      rethrow;
    }
  }
}
