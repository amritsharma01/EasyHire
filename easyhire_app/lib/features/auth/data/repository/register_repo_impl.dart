import 'package:dio/dio.dart';

import '../../domain/repositories/register_repo.dart';
import '../datasource/auth_remote_datasource.dart';

class RegisterRepoImpl implements RegisterRepo {
  final AuthRemoteDataSource remoteDataSource;

  RegisterRepoImpl(this.remoteDataSource);

  @override
  Future<Response> register({
    required String username,
    required String email,
    required String password,
    required bool isJobSeeker,
    required bool isEmployer,
  }) async {
    return await remoteDataSource.register(
      username: username,
      email: email,
      password: password,
      isJobSeeker: isJobSeeker,
      isEmployer: isEmployer,
    );
  }
}
