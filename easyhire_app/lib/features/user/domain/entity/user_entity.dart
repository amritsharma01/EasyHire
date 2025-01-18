class UserEntity {
  final String id;
  final String name;
  final String email;
  final bool isEmployer;
  final bool isJobseeker;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.isEmployer,
    required this.isJobseeker,
  });
}
