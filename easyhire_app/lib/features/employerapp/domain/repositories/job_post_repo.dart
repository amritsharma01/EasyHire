import 'package:dio/dio.dart';

abstract class JobPostRepo {
  Future<Response> jobPost({
    required String jobTitle,
    required String jobDescription,
    required double salary,
  });
}
