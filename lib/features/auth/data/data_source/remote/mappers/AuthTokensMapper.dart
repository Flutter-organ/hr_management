import '../../../../domain/models/AuthTokensModel.dart';
import '../enities/AuthTokensEntity.dart';

class AuthTokensMapper {
  static AuthTokensModel toDomain(AuthTokensEntity entity) {
    return AuthTokensModel(
      accessToken: entity.accessToken,
      tokenType: entity.tokenType,
    );
  }
}