import 'package:dio/dio.dart';
import 'package:easyhire_app/core/services/api_services/api_services.dart';
import 'package:easyhire_app/core/utils/api_endpoints.dart';

//Here we write the code for hitting the API endpoints using the API manager which we created earlier
class AuthRemoteDataSource {
  final ApiManager apiManager;

  AuthRemoteDataSource(this.apiManager);

  // Login method using ApiManager
  Future<Response> getTokens(String username, String password) async {
    try {
      final response = await apiManager.post(
        ApiEndpoints.login,
        data: {'username': username, 'password': password},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Register method using ApiManager
  // Future<Response> register(String name, String email, String password) async {
  //   try {
  //     final response = await apiManager.post(
  //       ApiEndpoints.register,
  //       data: {'name': name, 'email': email, 'password': password},
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow; // If an error occurs, rethrow it
  //   }
  // }
  Future<Response> register({
    required String username,
    required String email,
    required String password,
    required bool isJobSeeker,
    required bool isEmployer,
  }) async {
    try {
      final response = await apiManager.post(
        ApiEndpoints.register,
        data: {
          "username": username,
          "email": email,
          "password": password,
          "is_employer": isEmployer,
          "is_job_seeker": isJobSeeker,
        },
      );
      return response; // Assuming the response contains a `message` key
    } catch (e) {
      rethrow;
    }
  }
}
