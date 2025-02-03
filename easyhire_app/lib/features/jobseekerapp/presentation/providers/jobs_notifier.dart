// import 'package:easyhire_app/features/jobseekerapp/domain/entity/job_entity.dart';
// import 'package:easyhire_app/features/jobseekerapp/domain/usecase/fetch_job_usecase.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class JobState {
//   final bool isLoading;
//   final String? error;
//   final List<JobEntity>? jobs;
//   JobState({this.isLoading = false, this.error, this.jobs});
// }

// class JobStateNotifier extends StateNotifier<JobState> {
//   final FetchJobUsecase fetchJobUsecase;

//   JobStateNotifier(this.fetchJobUsecase) : super(JobState(isLoading: true));

//   Future<void> fetchJobs() async {
//     try {
//       state = JobState(isLoading: true);
//       final jobsList = await fetchJobUsecase.call();
//       state = JobState(isLoading: false, jobs: jobsList);
//     } catch (e) {
//       state = JobState(isLoading: false, error: e.toString());
//     }
//   }
// }

import 'package:easyhire_app/features/jobseekerapp/domain/usecase/fetch_job_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/job_entity.dart';

class JobStateNotifier extends StateNotifier<AsyncValue<List<JobEntity?>>> {
  final FetchJobUsecase _fetchJobUsecase;

  JobStateNotifier(
    this._fetchJobUsecase,
  ) : super(const AsyncValue.loading()) {
    fetchJobs();
  }

  Future<void> fetchJobs() async {
    try {
      final jobsList = await _fetchJobUsecase.call();
      print(jobsList);
      state = AsyncValue.data(jobsList);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString("error"));
    }
  }
}
