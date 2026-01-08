import 'package:dio/dio.dart';

import '../../../../../core/exceptions/app_exception.dart';
import '../../../../../core/network/api_constants.dart';
import '../../../../../core/network/dio_client.dart';
import 'AuthRemoteDataSource.dart';
import 'AuthRemoteDataSourceImp.dart';
import 'dto/CurrentUser.dart'; // if you have a separate file for endpoints

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  Future<void> register({
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    // final FormData staticData = FormData();
    // staticData.fields.add(
    //   MapEntry<String, String>('email', email),
    // );
    // staticData.fields.add(
    //   MapEntry<String, String>('phone',phoneNumber),
    // );
    // staticData.fields.add(
    //   MapEntry<String, String>('password',password),
    // );
    // staticData.fields.add(
    //   MapEntry<String, String>(
    //       'password_confirmation',confirmPassword),
    // );
    // staticData.fields.add(
    //   MapEntry<String, String>('login_type', 'email'),
    // );
     _dioClient.post(
      ApiConstants.register,
      data: {
        'email': email,
        'phone': phoneNumber,
        'password': password,
        'password_confirmation': confirmPassword,
        'login_type': 'email'
      },
    );
  }
}