import 'package:dio/dio.dart';

abstract class RegisterRepo {
  Future<Response> register({
    required String username,
    required String email,
    required String password,
    required bool isJobSeeker,
    required bool isEmployer,
  });
}
