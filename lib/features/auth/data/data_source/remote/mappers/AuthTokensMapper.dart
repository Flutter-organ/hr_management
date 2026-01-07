import '../../../../domain/models/AuthToken.dart';
import '../enities/AuthTokensDto.dart';

class AuthTokensMapper {
  static AuthToken toDomain(AuthTokensDto entity) {
    return AuthToken(
      accessToken: entity.accessToken,
      tokenType: entity.tokenType,
    );
  }
}