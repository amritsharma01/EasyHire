import 'package:easyhire_app/features/employerapp/domain/entities/application_entity.dart';

import '../repositories/received_appl_repo.dart';

class ReceivedAppnUsecase {
  final ReceivedApplRepo _receivedApplRepo;

  ReceivedAppnUsecase(this._receivedApplRepo);

  Future<List<ApplicationEntity>> call(int jobId) async {
    final response = await _receivedApplRepo.fetchApplications(jobId);
    return response;
  }
}
