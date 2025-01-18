import 'package:easyhire_app/features/user/domain/entity/user_entity.dart';
import 'package:flutter/foundation.dart';

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
      debugPrint("Parsing UserModel from JSON: $json");

      final id = json["id"].toString();
      debugPrint("Parsed ID: $id");

      final username = json["username"] as String;
      debugPrint("Parsed Username: $username");

      final email = json["email"] as String;
      debugPrint("Parsed Email: $email");

      final isEmployer = json["is_employer"] as bool;
      debugPrint("Parsed isEmployer: $isEmployer");

      final isJobseeker = json["is_job_seeker"] as bool;
      debugPrint("Parsed isJobseeker: $isJobseeker");

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
