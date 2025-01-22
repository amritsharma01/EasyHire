import 'package:easyhire_app/features/jobseekerapp/domain/entity/applied_job_entity.dart';

abstract class AppliedJobsRepo {
  Future<List<AppliedJobEntity>> fetchAppliedJobs();
}
