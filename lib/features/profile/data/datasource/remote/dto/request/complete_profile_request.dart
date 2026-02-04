class CompleteProfileRequestDto {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String gender;
  final String nationalId;
  final String address;
  // final int departmentId;
  // final String position;
  // final String employmentDate;
  // final double salary;

  const CompleteProfileRequestDto({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.nationalId,
    required this.address,
    // required this.departmentId,
    // required this.position,
    // required this.employmentDate,
    // required this.salary,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'national_id': nationalId,
      'address': address,
      // 'department_id': departmentId,
      // 'position': position,
      // 'employment_date': employmentDate,
      // 'salary': salary,
    };
  }
}