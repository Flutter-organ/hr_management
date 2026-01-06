class AuthTokensModel {
  final String accessToken;
  final String tokenType;

  const AuthTokensModel({
    required this.accessToken,
    required this.tokenType,
  });

  String get bearerToken => '$tokenType $accessToken';
}