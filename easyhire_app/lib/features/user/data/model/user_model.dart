import 'package:easyhire_app/features/user/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.isEmployer,
    required super.isJobseeker,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      final id = json["id"].toString();

      final username = json["username"] as String;

      final email = json["email"] as String;

      final isEmployer = json["is_employer"] as bool;

      final isJobseeker = json["is_job_seeker"] as bool;

      return UserModel(
        id: id,
        name: username,
        email: email,
        isEmployer: isEmployer,
        isJobseeker: isJobseeker,
      );
    } catch (e) {
      throw Exception("Error parsing UserModel: $e");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'is_Jobseeker': isJobseeker,
      'is_Employer': isEmployer,
    };
  }
}
