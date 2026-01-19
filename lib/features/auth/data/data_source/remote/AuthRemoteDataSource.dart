import 'dto/AuthResponse.dart';
import 'dto/ForgotPasswordRequest.dart';
import 'dto/ForgotPasswordResponse.dart';
import 'dto/ResetPasswordRequest.dart';
import 'dto/loginRequest.dart';
import 'dto/loginResponse.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/register_dto_request.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/verify_otp_dto.dart';
import 'dto/OtpVerifyResponse.dart';

abstract class AuthRemoteDataSource {
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest request);
  Future<AuthResponse> resetPassword(ResetPasswordRequest request);
  Future<LoginResponse> login(LoginRequest request);
  Future<bool> register({required RegisterDtoRequest registerDtoRequest});

  Future<OtpVerifyResponse> verifyOTP({
    required VerifyOtpDto verifyOtpDto,
  });
}