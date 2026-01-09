import 'package:hr_management/features/auth/data/data_source/remote/dto/ApiResponse.dart';

import 'dto/CurrentUser.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResponse> register({
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  });
  Future<ApiResponse> otp({required String email, required String code, required String type});

}
