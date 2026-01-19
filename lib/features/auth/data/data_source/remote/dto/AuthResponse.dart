import 'package:hr_management/features/auth/data/data_source/remote/dto/UserDto.dart';

class AuthResponse {
  final UserDto user;
  final String accessToken;
  final String tokenType;

  const AuthResponse({
    required this.user,
    required this.accessToken,
    this.tokenType = 'Bearer',
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String? ?? 'Bearer',
    );
  }
}