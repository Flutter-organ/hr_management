import '../../../../domain/models/UserModel.dart';
import '../enities/UserEntity.dart';

class UserMapper {
  static UserModel toDomain(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      isActive: entity.isActive,
      role: entity.role,
    );
  }
}