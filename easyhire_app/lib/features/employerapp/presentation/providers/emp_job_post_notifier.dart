import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/job_post_usecase.dart';

class JobPostNotifier extends StateNotifier<AsyncValue> {
  final JobPostUsecase _jobPostUsecase;

  JobPostNotifier(this._jobPostUsecase) : super(AsyncValue.loading());

  Future<void> applyJob(String title, String description, double salary) async {
    state = const AsyncValue.loading();

    try {
      final response = await _jobPostUsecase.call(title, description, salary);
      state = AsyncValue.data(response);
    } on Exception catch (e, stackTrace) {
      state = AsyncValue.error("Haha", stackTrace); // Error state
    }
  }
}
