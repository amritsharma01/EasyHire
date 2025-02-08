class JobEntity {
  final int id;
  final String title;
  final String description;
  final String salary;
  final String createdAt;
  final String employerName;
  final String location;
  //final int empId;

  JobEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.salary,
    required this.createdAt,
    //required this.empId,
    required this.employerName,
    required this.location,
  });
}
