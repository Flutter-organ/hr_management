
import '../../../../domain/enitites/login_type.dart';

class LoginRequest {
  final String identifier;
  final String password;
  final LoginType loginType;

  const LoginRequest({
    required this.identifier,
    required this.loginType,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'password': password,
      'login_type': loginType.value,
    };
  }
}