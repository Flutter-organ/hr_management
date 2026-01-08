import '../../../../domain/enitites/login_type.dart';

class ForgotPasswordRequest {
  final String identifier;
  final String type;
  final LoginType loginType;

  const ForgotPasswordRequest({
    required this.identifier,
    this.type = 'forget_password',
    required this.loginType,
  });

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'type': type,
      'login_type': loginType.value,
    };
  }
}