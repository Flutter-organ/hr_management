import 'package:dio/dio.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/ApiResponse.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/register_dto_request.dart';

import '../../../../../core/exceptions/app_exception.dart';
import '../../../../../core/network/api_constants.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../domain/usecase/RegisterUseCase.dart';
import 'AuthRemoteDataSource.dart';
import 'AuthRemoteDataSourceImp.dart';
import 'dto/CurrentUser.dart';
import 'dto/OtpVerifyResponse.dart';
import 'dto/verify_otp_dto.dart'; // if you have a separate file for endpoints

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<bool> register({
    required RegisterDtoRequest registerDtoRequest,
  }) async {
    final response = await _dioClient.post(
      ApiConstants.register,
      data: {
        "email": registerDtoRequest.email,
        "phone": registerDtoRequest.phone,
        "password": registerDtoRequest.password,
        "password_confirmation": registerDtoRequest.passwordConfirmation,
        "login_type": "email",
      },
    );
    return response.data['success'];
  }

  @override
  Future<OtpVerifyResponse> verifyOTP({
    required VerifyOtpDto verifyOtpDto,
  }) async {
    final response = await _dioClient.post(
      ApiConstants.verifyOtp,
      data: {
        "identifier": verifyOtpDto.identifier,
        "code": verifyOtpDto.code,
        "type": verifyOtpDto.type,
      },
    );
    return OtpVerifyResponse.fromJson(response.data['data']);
  }
}
