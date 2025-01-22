import 'package:easyhire_app/features/jobseekerapp/domain/entity/applied_job_entity.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/usecase/applied_jobs_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppliedJobsStateNotifier
    extends StateNotifier<AsyncValue<List<AppliedJobEntity?>>> {
  final AppliedJobsUsecase _fetchAppliedJobUsecase;

  AppliedJobsStateNotifier(
    this._fetchAppliedJobUsecase,
  ) : super(const AsyncValue.loading());

  Future<void> fetchJobs() async {
    state = const AsyncValue.loading();
    try {
      final jobsList = await _fetchAppliedJobUsecase.call();
      state = AsyncValue.data(jobsList);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString("error"));
    }
  }
}
