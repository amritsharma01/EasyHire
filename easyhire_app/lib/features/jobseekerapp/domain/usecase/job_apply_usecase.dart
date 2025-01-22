import 'package:dio/dio.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/repository/job_apply_repo.dart';

class JobApplyUsecase {
  final JobApplyRepo _jobApplyRepo;

  JobApplyUsecase(this._jobApplyRepo);

  Future<Response> call(int id, String letter) async {
    try {
      final response =
          await _jobApplyRepo.jobApply(jobId: id, cvLetter: letter);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
