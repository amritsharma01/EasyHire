import 'package:easyhire_app/features/employerapp/domain/entities/application_entity.dart';

class ApplicationModel extends ApplicationEntity {
  ApplicationModel({
    required super.userName,
    required super.userEmail,
    required super.jobTitle,
    required super.cvLetter,
    //required super.appliedTime,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    final userName = json["seeker_name"] as String;
    final userEmail = json["seeker_email"] as String;
    final jobTitle = json["job_title"] as String;
    final cvLetter = json["cover_letter"] as String;
    //final appliedTime = json["applied_at"] as String;

    return ApplicationModel(
        userName: userName,
        userEmail: userEmail,
        jobTitle: jobTitle,
        cvLetter: cvLetter);
  }
}
