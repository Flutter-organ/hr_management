import 'package:hr_management/core/network/api_constants.dart';
import 'package:hr_management/core/network/dio_client.dart';
import 'package:hr_management/features/auth/data/data_source/remote/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/ApiResponse.dart';

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  DioClient _dioClient;
  AuthRemoteDataSourceImp(this._dioClient);

  Future<ApiResponse> login({
    required String identifier,
    required String password,
    required String loginType,
  }) async {
    final response = await _dioClient.post(
      ApiConstants.login,
      data: {
        'identifier': identifier,
        'password': password,
        'login_type': loginType,
      },
    );

    return ApiResponse.fromJson(response.data);
  }
}
