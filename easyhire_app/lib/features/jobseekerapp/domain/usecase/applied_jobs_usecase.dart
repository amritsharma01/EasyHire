import 'package:easyhire_app/features/jobseekerapp/domain/entity/applied_job_entity.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/repository/applied_jobs_repo.dart';

class AppliedJobsUsecase {
  final AppliedJobsRepo appliedJobsRepo;

  AppliedJobsUsecase(this.appliedJobsRepo);

  Future<List<AppliedJobEntity>> call() async {
    final response = await appliedJobsRepo.fetchAppliedJobs();
    return response;
  }
}
