import 'package:easyhire_app/features/jobseekerapp/domain/entity/job_entity.dart';

abstract class EmpJobRepo {
  Future<List<JobEntity>> fetchJoblist();
}
