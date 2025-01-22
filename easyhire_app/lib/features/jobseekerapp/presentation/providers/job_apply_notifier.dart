import 'package:dio/dio.dart';
import 'package:easyhire_app/features/jobseekerapp/data/datasource/jobs_remote_datasource.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/usecase/job_apply_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobApplyNotifier extends StateNotifier<AsyncValue> {
  final JobApplyUsecase _jobApplyUsecase;

  JobApplyNotifier(this._jobApplyUsecase) : super(AsyncValue.data(null));

  Future<void> applyJob(int id, String cvLetter) async {
    state = const AsyncValue.loading();

    try {
      await _jobApplyUsecase.call(id, cvLetter);
      state = const AsyncValue.data(null);
    } on DioException catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace); // Error state
    } on AlreadyAppliedException catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace); // Error state
    } on Exception catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace); // Error state
    }
  }
}
