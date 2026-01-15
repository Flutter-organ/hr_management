import 'UserDto.dart';

class OtpVerifyResponse {
  final UserDto user;
  final String accessToken;
  final String tokenType;

  OtpVerifyResponse({
    required this.user,
    required this.accessToken,
    required this.tokenType,
  });

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    return OtpVerifyResponse(
      user: UserDto.fromJson(json['user']),
      accessToken: json['access_token'],
      tokenType: json['token_type'],
    );
  }
}