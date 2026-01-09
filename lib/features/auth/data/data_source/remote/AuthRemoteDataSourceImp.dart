import 'package:dio/dio.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/ApiResponse.dart';

import '../../../../../core/exceptions/app_exception.dart';
import '../../../../../core/network/api_constants.dart';
import '../../../../../core/network/dio_client.dart';
import 'AuthRemoteDataSource.dart';
import 'AuthRemoteDataSourceImp.dart';
import 'dto/CurrentUser.dart'; // if you have a separate file for endpoints

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  Future<ApiResponse> register({
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {

    print("iam in remote before post email is $email" );
    print(phoneNumber);
    print(password);
    print(confirmPassword);
    final response = await _dioClient.post(
      ApiConstants.register,
      data: {
        'email': email,
        'phone': phoneNumber,
        'password': password,
        'password_confirmation': confirmPassword,
        'login_type': 'email'
      },
    );
    print("respose data is ${response}");
    return ApiResponse.fromJson(response.data);
  }
  
  @override
  Future<ApiResponse> otp({required String email, required String code, required String type}) async{
   final response= await _dioClient.post( ApiConstants.verifyOtp, data: {
      'identifier': email,
      'code': code,
      'type': type
      
    });
    return ApiResponse.fromJson(response.data);
  }
}