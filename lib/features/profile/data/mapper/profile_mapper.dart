import '../../../../core/data/util/parsing.dart';
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
      dateOfBirth: DataFormat.parseDate(dto.dateOfBirth) ?? DateTime.now(),
      gender: Gender.fromString(dto.gender ?? 'male'),
      address: dto.address ?? '',
      profileImage: dto.profileImage,
      jobTitle: dto.jobTitle,
      department: dto.department,
      manager: dto.manager,
      hireDate: DataFormat.parseDate(dto.hireDate) ?? DateTime.now(),
      baseSalary: dto.baseSalary,
      hourlyRate: dto.hourlyRate,
      employmentType: dto.employmentType ?? 'full_time',
      status: dto.status ?? 'pending',
      role: dto.role ?? 'employee',
      terminationDate: DataFormat.parseDate(dto.terminationDate),
      createdAt: DataFormat.parseDateTime(dto.createdAt),
      updatedAt: DataFormat.parseDateTime(dto.updatedAt),
    );
  }

  static CompleteProfileRequestDto toCompleteProfileRequestDto({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required String gender,
    required String nationalId,
    required String address,
    // required int departmentId,
    // required String position,
    // required DateTime employmentDate,
    // required double salary,
  }) {
    return CompleteProfileRequestDto(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: DataFormat.formatDate(dateOfBirth),
      gender: gender,
      nationalId: nationalId,
      address: address,
      // departmentId: departmentId,
      // position: position,
      // employmentDate: _formatDate(employmentDate),
      // salary: salary,
    );
  }

  static UpdateProfileRequestDto toUpdateProfileRequestDto({
    String? firstName,
    String? lastName,
    String? phone,
    String? address,
  }) {
    return UpdateProfileRequestDto(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      address: address,
    );
  }

}