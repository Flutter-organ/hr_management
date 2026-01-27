import '../employee_profile_dto.dart';

class EmployeeProfileResponseDto {
  final EmployeeProfileDto profile;

  const EmployeeProfileResponseDto({required this.profile});

  factory EmployeeProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return EmployeeProfileResponseDto(
      profile: EmployeeProfileDto.fromJson(json),
    );
  }
}