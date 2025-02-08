import 'package:easyhire_app/features/employerapp/domain/usecases/emp_job_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../jobseekerapp/domain/entity/job_entity.dart';

class EmpJobStateNotifier extends StateNotifier<AsyncValue<List<JobEntity?>>> {
  final EmpJobUsecase _empJobUsecase;

  EmpJobStateNotifier(
    this._empJobUsecase,
  ) : super(const AsyncValue.loading()) {
    fetchJobs();
  }

  Future<void> fetchJobs({String? query}) async {
    try {
      final jobsList = await _empJobUsecase.call(query: query);
      print(jobsList);
      state = AsyncValue.data(jobsList);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString("error"));
    }
  }

  void clearState() {
    state = const AsyncValue.loading();
  }

  // void login() {
  //   clearState();
  //   fetchJobs();
  // }
}
