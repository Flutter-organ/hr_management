import '../../../../domain/models/AuthTokensModel.dart';

class AuthTokensEntity {
  final String accessToken;
  final String tokenType;

  AuthTokensEntity({
    required this.accessToken,
    required this.tokenType,
  });

  factory AuthTokensEntity.fromJson(Map<String, dynamic> json) {
    return AuthTokensEntity(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
    );
  }

  AuthTokensModel toDomain() => AuthTokensModel(
    accessToken: accessToken,
    tokenType: tokenType,
  );
}