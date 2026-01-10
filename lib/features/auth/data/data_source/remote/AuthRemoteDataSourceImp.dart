import 'package:dio/dio.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/ApiResponse.dart';

import '../../../../../core/exceptions/app_exception.dart';
import '../../../../../core/network/api_constants.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../domain/usecase/RegisterUseCase.dart';
import 'AuthRemoteDataSource.dart';
import 'AuthRemoteDataSourceImp.dart';
import 'dto/CurrentUser.dart'; // if you have a separate file for endpoints

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  Future<bool> register({required RegisterParams registerParams}) async {
    print("registerParams is ${'email' + registerParams.email}");
    print("registerParams is ${'phone' + registerParams.PhoneNumber}");
    print("registerParams is ${'password' + registerParams.password}");
    print(
      "registerParams is ${'password_confirmation' + registerParams.confirmPassword}",
    );
    final response = await _dioClient.post(
      ApiConstants.register,
      data: {
        "email": registerParams.email,
        "phone" : registerParams.PhoneNumber,
        "password": registerParams.password,
        "password_confirmation": registerParams.confirmPassword,
        "login_type": "email"
      }
    );
    print("respose data is ${response}");
    return response.data['success'];
  }

  @override
  Future<ApiResponse> otp({
    required String email,
    required String code,
    required String type,
  }) async {
    final response = await _dioClient.post(
      ApiConstants.verifyOtp,
      data: {'identifier': email, 'code': code, 'type': type},
    );
    return ApiResponse.fromJson(response.data);
  }
}
