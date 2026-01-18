import 'dto/AuthResponse.dart';
import 'dto/ForgotPasswordRequest.dart';
import 'dto/ForgotPasswordResponse.dart';
import 'dto/ResetPasswordRequest.dart';
import 'dto/loginRequest.dart';
import 'dto/loginResponse.dart';

abstract class AuthRemoteDataSource {
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest request);
  Future<AuthResponse> resetPassword(ResetPasswordRequest request);
  Future<LoginResponse> login(LoginRequest request);
}