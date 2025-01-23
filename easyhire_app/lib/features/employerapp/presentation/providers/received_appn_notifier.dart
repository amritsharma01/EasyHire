import 'package:easyhire_app/features/employerapp/domain/entities/application_entity.dart';

import 'package:easyhire_app/features/employerapp/domain/usecases/received_appn_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReceivedAppnNotifier
    extends StateNotifier<AsyncValue<List<ApplicationEntity?>>> {
  final ReceivedAppnUsecase _receivedAppnUsecase;

  ReceivedAppnNotifier(
    this._receivedAppnUsecase,
  ) : super(const AsyncValue.loading());

  Future<void> fetchApplications(int jobId) async {
    state = const AsyncValue.loading();
    try {
      final jobAppnList = await _receivedAppnUsecase.call(jobId);

      state = AsyncValue.data(jobAppnList);
      print("sjdfkaadjfkadfnfjka");
      print(jobAppnList);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString("error"));
    }
  }
}
