import 'package:dio/dio.dart';
import 'package:easyhire_app/features/employerapp/domain/repositories/job_post_repo.dart';

class JobPostUsecase {
  final JobPostRepo _jobPostRepo;

  JobPostUsecase(this._jobPostRepo);
  Future<Response> call(String title, String description, double salary) async {
    try {
      final response = await _jobPostRepo.jobPost(
          jobTitle: title, jobDescription: description, salary: salary);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
