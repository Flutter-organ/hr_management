import 'package:hr_management/features/profile/data/datasource/remote/profile_remote_data_source.dart';

import '../../../../../core/data/exception/app_exception.dart';
import '../../../../../core/data/network/api_constants.dart';
import '../../../../../core/data/network/dio_client.dart';
import 'dto/employee_profile_dto.dart';
import 'dto/request/complete_profile_request.dart';
import 'dto/request/update_profile_request_dto.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient _dioClient;

  const ProfileRemoteDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<EmployeeProfileDto> getProfile() async {
    final response = await _dioClient.get(ApiConstants.getProfile);
    
    final success = response.data['success'] as bool?;
    if (success == false) {
      final errorCode = response.data['error_code'] as String?;
      if (errorCode == 'PROFILE_NOT_COMPLETED') {
        throw ServerException(
          message: response.data['message'] as String? ?? 'Profile not completed yet.',
          code: 'PROFILE_NOT_COMPLETED',
          statusCode: 200,
        );
      }
    }

    final data = response.data['data'] as Map<String, dynamic>;
    return EmployeeProfileDto.fromJson(data);
  }

  @override
  Future<EmployeeProfileDto> completeProfile(CompleteProfileRequestDto request) async {
    final response = await _dioClient.post(
      ApiConstants.completeProfile,
      data: request.toJson(),
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return EmployeeProfileDto.fromJson(data);
  }

  @override
  Future<EmployeeProfileDto> updateProfile(UpdateProfileRequestDto request) async {
    final response = await _dioClient.put(
      ApiConstants.updateProfile,
      data: request.toJson(),
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return EmployeeProfileDto.fromJson(data);
  }
}