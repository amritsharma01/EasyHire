import 'package:dio/dio.dart';
import 'package:easyhire_app/features/jobseekerapp/data/model/job_model.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/services/get.dart';
import '../../domain/repositories/emp_job_repo.dart';
import '../datasource/emp_jobs_remote_datasource.dart';

class EmpJobRepoImpl implements EmpJobRepo {
  final EmpJobsRemoteDatasource _empJobsRemoteDatasource;

  EmpJobRepoImpl(this._empJobsRemoteDatasource);

  @override
  Future<List<JobModel>> fetchJoblist({String? query}) async {
    try {
      return await _empJobsRemoteDatasource.fetchAvailableJobs(query: query);
    } on DioException catch (e) {
      debugPrint(e.message);
      Get.snackbar("Unexpected Error Occur");
      rethrow;
    }
  }
}
