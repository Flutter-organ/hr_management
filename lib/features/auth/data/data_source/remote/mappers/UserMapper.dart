import '../../../../domain/models/User.dart';
import '../enities/UserDto.dart';

class UserMapper {
  static User toDomain(UserDto entity) {
    return User(
      id: entity.id,
      email: entity.email,
      isActive: entity.isActive,
      role: entity.role,
    );
  }
}