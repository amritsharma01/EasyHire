import '../../../jobseekerapp/domain/entity/job_entity.dart';

import '../repositories/emp_job_repo.dart';

class EmpJobUsecase {
  final EmpJobRepo _empJobRepo;

  EmpJobUsecase(this._empJobRepo);

  Future<List<JobEntity>> call() async {
    final response = await _empJobRepo.fetchJoblist();
    return response;
  }
}
