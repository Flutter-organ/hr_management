import 'package:easy_localization/easy_localization.dart';

import '../../domain/entity/employee_profile.dart';
import '../../domain/entity/gender.dart';
import '../datasource/remote/dto/employee_profile_dto.dart';
import '../datasource/remote/dto/request/complete_profile_request.dart';
import '../datasource/remote/dto/request/update_profile_request_dto.dart';

class ProfileMapper {
  ProfileMapper._();

  static EmployeeProfile toDomain(EmployeeProfileDto dto) {
    return EmployeeProfile(
      id: dto.id ?? 0,
      employeeCode: dto.employeeCode ?? '',
      firstName: dto.firstName ?? '',
      lastName: dto.lastName ?? '',
      fullName: dto.fullName ?? '',
      phone: dto.phone,
      dateOfBirth: _parseDate(dto.dateOfBirth) ?? DateTime.now(),
      gender: Gender.fromString(dto.gender ?? 'male'),
      address: dto.address ?? '',
      profileImage: dto.profileImage,
      jobTitle: dto.jobTitle,
      department: dto.department,
      manager: dto.manager,
      hireDate: _parseDate(dto.hireDate) ?? DateTime.now(),
      baseSalary: dto.baseSalary,
      hourlyRate: dto.hourlyRate,
      employmentType: dto.employmentType ?? 'full_time',
      status: dto.status ?? 'pending',
      role: dto.role ?? 'employee',
      terminationDate: _parseDate(dto.terminationDate),
      createdAt: _parseDateTime(dto.createdAt),
      updatedAt: _parseDateTime(dto.updatedAt),
    );
  }

  static CompleteProfileRequestDto toCompleteProfileRequestDto({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required Gender gender,
    required String nationalId,
    required String address,
    required int departmentId,
    required String position,
    required DateTime employmentDate,
    required double salary,
  }) {
    return CompleteProfileRequestDto(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: _formatDate(dateOfBirth),
      gender: gender.name,
      nationalId: nationalId,
      address: address,
      departmentId: departmentId,
      position: position,
      employmentDate: _formatDate(employmentDate),
      salary: salary,
    );
  }

  static UpdateProfileRequestDto toUpdateProfileRequestDto({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required Gender gender,
    required String address,
    String? phone,
  }) {
    return UpdateProfileRequestDto(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: _formatDate(dateOfBirth),
      gender: gender.name,
      address: address,
      phone: phone,
    );
  }

  static DateTime? _parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateFormat('yyyy-MM-dd').parse(dateString);
    } catch (e) {
      return null;
    }
  }

  static DateTime? _parseDateTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return null;
    try {
      return DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTimeString);
    } catch (e) {
      return null;
    }
  }

  static String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}