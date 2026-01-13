import 'package:hr_management/features/auth/data/data_source/remote/dto/register_dto_request.dart';
import 'package:hr_management/features/auth/domain/enitites/Register.dart';

class RegisterMapper {
  RegisterMapper._();

  static RegisterDtoRequest toDto(Register register) {
    return RegisterDtoRequest(
      email: register.email,
      password: register.password,
      passwordConfirmation: register.passwordConfirmation,
      phone: register.phone,
      loginType: register.registerType,
    );
  }
}