import '../../domain/enitites/Register.dart';
import '../../domain/enitites/User.dart';
import '../../domain/enitites/verify_otp.dart';
import '../data_source/remote/dto/UserDto.dart';
import '../data_source/remote/dto/register_dto_request.dart';
import '../data_source/remote/dto/verify_otp_dto.dart';

class AuthMapper {
  static RegisterDtoRequest toRegisterDtoRequest(Register register) {
    return RegisterDtoRequest(
      email: register.email,
      password: register.password,
      passwordConfirmation: register.passwordConfirmation,
      phone: register.phone,
      loginType: register.registerType,
    );
  }

  static VerifyOtpDto toVerifyOtpDto(VerifyOTP verifyOtp) {
    return (VerifyOtpDto(
      identifier: verifyOtp.identifier,
      code: verifyOtp.code,
      type: verifyOtp.type,
    ));
  }
  static User toUser(UserDto userDto) {
    return User(
      id: userDto.id,
      email: userDto.email,
      phone: userDto.phone,
      isActive: userDto.isActive,
      role: userDto.role,
    );
  }
}
