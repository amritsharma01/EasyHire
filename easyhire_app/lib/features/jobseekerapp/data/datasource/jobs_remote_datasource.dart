import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easyhire_app/features/jobseekerapp/data/model/applied_job_model.dart';
import 'package:easyhire_app/features/jobseekerapp/data/model/job_model.dart';

import '../../../../core/services/api_services/api_services.dart';

import '../../../../core/utils/api_endpoints.dart';

class AlreadyAppliedException implements Exception {
  final String message;
  AlreadyAppliedException(this.message);
}

class NoInternetException implements Exception {
  final String message;
  NoInternetException(this.message);
}

class JobsRemoteDatasource {
  final ApiManager apiManager;

  JobsRemoteDatasource(this.apiManager);

  Future<List<JobModel>> fetchAvailableJobs(
      {String? query,
      String? location,
      String? salaryMin,
      String? salaryMax}) async {
    List<JobModel> joblist = [];
    final response =
        await apiManager.get(ApiEndpoints.joblist, queryParameters: {
      if (query != null && query.isNotEmpty) "search": query,
      if (location != null && location.isNotEmpty) "location": location,
      if (salaryMin != null && salaryMin.isNotEmpty) "salary_min": salaryMin,
      if (salaryMax != null && salaryMax.isNotEmpty) "salary_max": salaryMax,
    });
    final list = response.data['results'];

    for (var i in list) {
      joblist.add(JobModel.fromJson(i));
    }

    return joblist;
  }

  Future<Response> apply({
    required int jobId,
    required String cvLetter,
  }) async {
    try {
      final response = await apiManager.post(ApiEndpoints.apply, data: {
        "job": jobId,
        "cover_letter": cvLetter,
      });
      if (response.statusCode == 201) {
        return response;
      } else if (response.statusCode == 208) {
        throw AlreadyAppliedException("Already Applied");
      } else {
        throw Exception("Unknown Error");
      }
    } on DioException {
      throw Exception("Already Applied");
    } on SocketException {
      throw NoInternetException("No internet connection");
    }
  }

  Future<List<AppliedJobModel>> fetchAppliedJobs() async {
    List<AppliedJobModel> appliedjoblist = [];
    final response = await apiManager.get(ApiEndpoints.seekerApplications);
    final list = response.data['results'];

    for (var i in list) {
      appliedjoblist.add(AppliedJobModel.fromJson(i));
    }
    print(appliedjoblist);
    return appliedjoblist;
  }
}
