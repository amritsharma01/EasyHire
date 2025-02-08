import 'package:easyhire_app/features/jobseekerapp/domain/entity/job_entity.dart';

abstract class JobRepo {
  Future<List<JobEntity>> fetchJoblist(
      {String? query, String? location, String? salaryMin, String? salaryMax});
}
