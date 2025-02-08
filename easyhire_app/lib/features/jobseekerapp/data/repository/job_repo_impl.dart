import 'package:dio/dio.dart';
import 'package:easyhire_app/features/jobseekerapp/data/datasource/jobs_remote_datasource.dart';
import 'package:easyhire_app/features/jobseekerapp/data/model/job_model.dart';

import 'package:easyhire_app/features/jobseekerapp/domain/repository/job_repo.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/services/get.dart';

class JobRepoImpl implements JobRepo {
  final JobsRemoteDatasource jobRemoteDatasource;

  JobRepoImpl(this.jobRemoteDatasource);

  @override
  Future<List<JobModel>> fetchJoblist(
      {String? query,
      String? location,
      String? salaryMin,
      String? salaryMax}) async {
    try {
      return await jobRemoteDatasource.fetchAvailableJobs(
          query: query,
          location: location,
          salaryMin: salaryMin,
          salaryMax: salaryMax);
    } on DioException catch (e) {
      debugPrint(e.message);
      Get.snackbar("Unexpected Error Occur");
      rethrow;
    }
  }
}
