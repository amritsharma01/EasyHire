import 'package:dio/dio.dart';

import '../repositories/register_repo.dart';

class RegisterUseCase {
  final RegisterRepo repository;

  RegisterUseCase(this.repository);

  Future<Response> execute({
    required String username,
    required String email,
    required String password,
    required bool isJobSeeker,
    required bool isEmployer,
  }) async {
    final response = await repository.register(
      username: username,
      email: email,
      password: password,
      isJobSeeker: isJobSeeker,
      isEmployer: isEmployer,
    );
    return response;
  }
}
