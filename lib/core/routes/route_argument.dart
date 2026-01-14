import '../../features/auth/domain/enitites/login_type.dart';

abstract class RouteArgument {
  const RouteArgument();
}

class VerifyOtpArgument extends RouteArgument {
  final String identifier;
  final LoginType loginType;

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