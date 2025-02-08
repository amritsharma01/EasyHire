import '../entity/job_entity.dart';
import '../repository/job_repo.dart';

class FetchJobUsecase {
  final JobRepo jobrepo;

  FetchJobUsecase(this.jobrepo);

  Future<List<JobEntity>> call(
      {String? query,
      String? location,
      String? salaryMin,
      String? salaryMax}) async {
    final response = await jobrepo.fetchJoblist(
        query: query,
        location: location,
        salaryMin: salaryMin,
        salaryMax: salaryMax);
    return response;
  }
}
