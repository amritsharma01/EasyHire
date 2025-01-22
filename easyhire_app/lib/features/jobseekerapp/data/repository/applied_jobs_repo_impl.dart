import 'package:easyhire_app/features/jobseekerapp/data/datasource/jobs_remote_datasource.dart';
import 'package:easyhire_app/features/jobseekerapp/data/model/applied_job_model.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/repository/applied_jobs_repo.dart';

class AppliedJobsRepoImpl implements AppliedJobsRepo {
  final JobsRemoteDatasource _datasource;

  AppliedJobsRepoImpl(this._datasource);

  @override
  Future<List<AppliedJobModel>> fetchAppliedJobs() async {
    try {
      return await _datasource.fetchAppliedJobs();
    } catch (e) {
      rethrow;
    }
  }
}
