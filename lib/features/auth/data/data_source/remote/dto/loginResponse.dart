import 'UserDto.dart';

class LoginResponse {
  final UserDto user;
  final String accessToken;
  final String tokenType;

  const LoginResponse({
    required this.user,
    required this.accessToken,
    this.tokenType = 'Bearer',
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String? ?? 'Bearer',
    );
  }
}