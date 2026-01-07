import '../../../../domain/models/AuthToken.dart';

class AuthTokensDto {
  final String? accessToken;
  final String? tokenType;

  AuthTokensDto({
    required this.accessToken,
    required this.tokenType,
  });

  factory AuthTokensDto.fromJson(Map<String, dynamic> json) {
    return AuthTokensDto(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
    );
  }
}