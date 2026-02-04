import 'package:equatable/equatable.dart';

import 'gender.dart';


class EmployeeProfile extends Equatable {
  final int id;
  final String employeeCode;
  final String firstName;
  final String lastName;
  final String fullName;
  final String? email;
  //final String? nationalId;
  final String? phone;
  final DateTime dateOfBirth;
  final Gender gender;
  final String address;
  final String? profileImage;
  final String? jobTitle;
  final String? department;
  final String? manager;
  final DateTime hireDate;
  final double? baseSalary;
  final double? hourlyRate;
  final String employmentType;
  final String status;
  final String role;
  final DateTime? terminationDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;


  const EmployeeProfile({
    required this.id,
    required this.employeeCode,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    this.email,
    //this.nationalId,
    this.phone,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    this.profileImage,
    this.jobTitle,
    this.department,
    this.manager,
    required this.hireDate,
    this.baseSalary,
    this.hourlyRate,
    required this.employmentType,
    required this.status,
    this.terminationDate,
    this.role = 'employee',
    this.createdAt,
    this.updatedAt,
  });

  bool get isActive => status == 'active';

  String get formattedSalary {
    if (baseSalary == null) return 'Not specified';
    return '\$${baseSalary!.toStringAsFixed(0)}';
  }

  String get formattedGender {
    return gender.name.toUpperCase();
  }

  String get formattedDateOfBirth {
    return '${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}';
  }

  String get formattedEmploymentDate {
    return '${hireDate.day}/${hireDate.month}/${hireDate.year}';
  }

  String get displayJobTitle => jobTitle ?? 'Employee';

  bool get isProfileComplete {
    return firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        address.isNotEmpty &&
        employmentType.isNotEmpty &&
        jobTitle != null;
  }


  @override
  List<Object?> get props => [
    id,
    employeeCode,
    firstName,
    lastName,
    fullName,
    email,
    //nationalId,
    dateOfBirth,
    gender,
    address,
    phone,
    profileImage,
    jobTitle,
    department,
    manager,
    hireDate,
    baseSalary,
    hourlyRate,
    employmentType,
    status,
    terminationDate,
  ];

  EmployeeProfile copyWith({
    int? id,
    String? employeeCode,
    String? firstName,
    String? lastName,
    String? fullName,
    String? phone,
    String? email,
    //String? nationalId,
    DateTime? dateOfBirth,
    Gender? gender,
    String? address,
    String? profileImage,
    String? jobTitle,
    String? department,
    String? manager,
    DateTime? hireDate,
    double? baseSalary,
    double? hourlyRate,
    String? employmentType,
    String? status,
    String? role,
    DateTime? terminationDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EmployeeProfile(
      id: id ?? this.id,
      employeeCode: employeeCode ?? this.employeeCode,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      //nationalId: nationalId ?? this.nationalId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
      jobTitle: jobTitle ?? this.jobTitle,
      department: department ?? this.department,
      manager: manager ?? this.manager,
      hireDate: hireDate ?? this.hireDate,
      baseSalary: baseSalary ?? this.baseSalary,
      hourlyRate: hourlyRate ?? this.hourlyRate,
      employmentType: employmentType ?? this.employmentType,
      status: status ?? this.status,
      role: role ?? this.role,
      terminationDate: terminationDate ?? this.terminationDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }


}