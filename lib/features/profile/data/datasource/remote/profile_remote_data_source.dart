import 'dto/employee_profile_dto.dart';
import 'dto/request/complete_profile_request.dart';
import 'dto/request/update_profile_request_dto.dart';
import 'dto/response/upload_image_response_dto.dart';

abstract class ProfileRemoteDataSource {
  Future<EmployeeProfileDto> getProfile();
  Future<EmployeeProfileDto> completeProfile(CompleteProfileRequestDto request);
  Future<EmployeeProfileDto> updateProfile(UpdateProfileRequestDto request);
  Future<UploadImageResponseDto> uploadProfileImage(String filePath);
}