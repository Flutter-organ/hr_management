import 'dto/AuthResponse.dart';
import 'dto/ForgotPasswordRequest.dart';
import 'dto/ForgotPasswordResponse.dart';
import 'dto/ResetPasswordRequest.dart';

abstract class AuthRemoteDataSource {
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest request);
  Future<AuthResponse> resetPassword(ResetPasswordRequest request);
}