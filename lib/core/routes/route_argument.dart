import '../../features/auth/domain/enitites/auth_type.dart';

abstract class RouteArgument {
  const RouteArgument();
}

class VerifyOtpArgument extends RouteArgument {
  final String identifier;
  final AuthType loginType;

  const VerifyOtpArgument({
    required this.identifier,
    required this.loginType,
  });
}

class ResetPasswordArgument extends RouteArgument {
  final String identifier;
  final String otp;

  const ResetPasswordArgument({
    required this.identifier,
    required this.otp,
  });
}