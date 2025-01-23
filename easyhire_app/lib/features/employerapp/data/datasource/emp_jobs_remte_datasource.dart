import 'package:easyhire_app/core/services/api_services/api_services.dart';
import 'package:easyhire_app/features/employerapp/data/models/application_model.dart';

import '../../../../core/utils/api_endpoints.dart';
import '../../../jobseekerapp/data/model/job_model.dart';

class EmpJobsRemoteDatasource {
  final ApiManager _apiManager;

  EmpJobsRemoteDatasource(this._apiManager);

  Future<List<JobModel>> fetchAvailableJobs() async {
    List<JobModel> joblist = [];
    final response = await _apiManager.get(ApiEndpoints.empoyerJobs);
    final list = response.data['results'];
    for (var i in list) {
      joblist.add(JobModel.fromJson(i));
    }
    return joblist;
  }

  Future<List<ApplicationModel>> fetchApplications(int jobId) async {
    List<ApplicationModel> jobAppnlist = [];
    final response =
        await _apiManager.get(ApiEndpoints.employerApplicaitons(jobId));
    final list = response.data['results'];
    for (var i in list) {
      jobAppnlist.add(ApplicationModel.fromJson(i));
    }
    return jobAppnlist;
  }
}
