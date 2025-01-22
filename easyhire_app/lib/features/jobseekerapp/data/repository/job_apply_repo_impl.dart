import 'package:dio/dio.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/repository/job_apply_repo.dart';

import '../datasource/jobs_remote_datasource.dart';

class JobApplyRepoImpl implements JobApplyRepo {
  final JobsRemoteDatasource _datasource;

  JobApplyRepoImpl(this._datasource);

  @override
  Future<Response> jobApply({
    required int jobId,
    required String cvLetter,
  }) async {
    try {
      return await _datasource.apply(jobId: jobId, cvLetter: cvLetter);
    } catch (e) {
      rethrow;
    }
  }
}
