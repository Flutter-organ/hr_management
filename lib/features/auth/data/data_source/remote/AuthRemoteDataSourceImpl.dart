import '../../../../../core/network/api_constants.dart';
import '../../../../../core/network/dio_client.dart';
import 'AuthRemoteDataSource.dart';
import 'dto/AuthResponse.dart';
import 'dto/ForgotPasswordRequest.dart';
import 'dto/ForgotPasswordResponse.dart';
import 'dto/ResetPasswordRequest.dart';
import 'dto/loginRequest.dart';
import 'dto/loginResponse.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final DioClient _dioClient;

  const AuthRemoteDataSourceImp({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<ForgotPasswordResponse> forgotPassword(
      ForgotPasswordRequest request,
      ) async {
    final response = await _dioClient.post(
      ApiConstants.forgotPassword,
      data: request.toJson(),
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return ForgotPasswordResponse.fromJson(data);
  }

  @override
  Future<AuthResponse> resetPassword(ResetPasswordRequest request) async {
    final response = await _dioClient.post(
      ApiConstants.verifyForgotPasswordOtp,
      data: request.toJson(),
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return AuthResponse.fromJson(data);
  }

  @override
  Future<LoginResponse> login(
    LoginRequest request,
  ) async {
    final response = await _dioClient.post(
      ApiConstants.login,
      data: request.toJson(),
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return LoginResponse.fromJson(data);
  }
}