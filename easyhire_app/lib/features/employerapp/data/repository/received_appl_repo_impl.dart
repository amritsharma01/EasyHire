import 'package:easyhire_app/features/employerapp/data/datasource/emp_jobs_remote_datasource.dart';
import 'package:easyhire_app/features/employerapp/data/models/application_model.dart';
import 'package:easyhire_app/features/employerapp/domain/repositories/received_appl_repo.dart';

class ReceivedApplRepoImpl implements ReceivedApplRepo {
  final EmpJobsRemoteDatasource _empJobsRemoteDatasource;

  ReceivedApplRepoImpl(this._empJobsRemoteDatasource);

  @override
  Future<List<ApplicationModel>> fetchApplications(int jobId) async {
    try {
      return await _empJobsRemoteDatasource.fetchApplications(jobId);
    } catch (e) {
      rethrow;
    }
  }
}
