import '../../domain/enitites/User.dart';
import '../data_source/remote/dto/UserDto.dart';

class AuthMapper {
  static User toDomain(UserDto userDto){
    User user = User(
      id: userDto.id,
      email: userDto.email,
      isActive: userDto.isActive,
        role: userDto.role,
    );
    return user;
  }
}