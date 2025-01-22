import 'package:easyhire_app/features/jobseekerapp/domain/entity/applied_job_entity.dart';

class AppliedJobModel extends AppliedJobEntity {
  AppliedJobModel({
    required super.jobtitle,
    required super.cvLetter,
  });

  factory AppliedJobModel.fromJson(Map<String, dynamic> json) {
    final jobtitle = json["job_title"] as String;
    final cvLetter = json["cover_letter"] as String;

    return AppliedJobModel(jobtitle: jobtitle, cvLetter: cvLetter);
  }
}
