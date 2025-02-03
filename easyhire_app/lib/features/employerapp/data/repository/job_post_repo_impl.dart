import 'package:dio/dio.dart';
import 'package:easyhire_app/features/employerapp/data/datasource/emp_jobs_remote_datasource.dart';
import 'package:easyhire_app/features/employerapp/domain/repositories/job_post_repo.dart';

class JobPostRepoImpl implements JobPostRepo {
  final EmpJobsRemoteDatasource _empJobsRemoteDatasource;
  JobPostRepoImpl(this._empJobsRemoteDatasource);

  @override
  Future<Response> jobPost({
    required String jobTitle,
    required double salary,
    required String jobDescription,
  }) async {
    try {
      return await _empJobsRemoteDatasource.postJob(
          jobTitle, jobDescription, salary);
    } catch (e) {
      rethrow;
    }
  }
}
