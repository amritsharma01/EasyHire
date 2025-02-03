import 'package:easyhire_app/features/jobseekerapp/domain/entity/job_entity.dart';

class JobModel extends JobEntity {
  JobModel({
    required super.id,
    required super.title,
    required super.description,
    required super.salary,
    required super.createdAt,
    required super.employerName,
    //required super.empId,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    final id = json["id"] as int;

    final title = json["title"] as String;

    final description = json["description"] as String;

    final salary = json["salary"] as String;

    final createdAt = json["created_at"] as String;

    final employerName = json["employer_name"] as String;

    // final empId = json["employer"] as int;

    return JobModel(
      id: id,
      title: title,
      description: description,
      salary: salary,
      createdAt: createdAt,
      employerName: employerName,
      //empId: empId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'salary': salary,
      'created_at': createdAt,
      'employer_name': employerName,
      //'empId': empId,
    };
  }
}
