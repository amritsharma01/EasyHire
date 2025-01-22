import 'package:dio/dio.dart';

abstract class JobApplyRepo {
  Future<Response> jobApply({
    required int jobId,
    required String cvLetter,
  });
}
