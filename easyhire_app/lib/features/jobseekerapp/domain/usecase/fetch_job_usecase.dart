import '../entity/job_entity.dart';
import '../repository/job_repo.dart';

class FetchJobUsecase {
  final JobRepo jobrepo;

  FetchJobUsecase(this.jobrepo);

  Future<List<JobEntity>> call() async {
    final response = await jobrepo.fetchJoblist();
    return response;
  }
}
