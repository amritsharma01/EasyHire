import 'package:easyhire_app/features/employerapp/domain/entities/application_entity.dart';

abstract class ReceivedApplRepo {
  Future<List<ApplicationEntity>> fetchApplications(int jobId);
}
