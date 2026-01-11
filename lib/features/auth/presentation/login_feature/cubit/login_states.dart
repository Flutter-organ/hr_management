import 'package:hr_management/core/design_system/components/popups/sign_in_popup.dart';
import 'package:hr_management/features/auth/domain/enitites/User.dart';

class LoginStates {
  final LoginType loginType;
  final bool isObscure;
  final String countryCode;
  final bool isChecked;
  final bool isEnabled;
  final List<String> countryFilter;
  LoginStates({
    this.loginType = LoginType.email,
    this.isObscure = true,
    this.countryCode = '20',
    this.isChecked = false,
    this.countryFilter = const [
      'EG',
      'PS',
      'SA',
      'AE',
      'KW',
      'QA',
      'JO',
      'LB',
      'SY',
      'IQ',
      'OM',
      'BH',
      'LY',
      'MA',
      'DZ',
      'TN',
      'SD',
      'YE',
    ],
    this.isEnabled = false,
  });
  LoginStates copyWith({
    LoginType? loginType,
    bool? isObscure,
    String? countryCode,
    bool? isChecked,
    bool? isEnabled,
  }) {
    return LoginStates(
      loginType: loginType ?? this.loginType,
      isObscure: isObscure ?? this.isObscure,
      countryCode: countryCode ?? this.countryCode,
      isChecked: isChecked ?? this.isChecked,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}

final class LoginInitial extends LoginStates {}

final class LoginLoading extends LoginStates {
  LoginLoading({
    super.loginType,
    super.isObscure,
    super.countryCode,
    super.isChecked,
    super.isEnabled,
  });
}

final class LoginSuccess extends LoginStates {
  final User user;
  LoginSuccess({
    required this.user,
    super.loginType,
    super.isObscure,
    super.countryCode,
    super.isChecked,
    super.isEnabled,
  });
}

final class LoginFailure extends LoginStates {
  final String message;

  LoginFailure({
    required this.message,
    super.loginType,
    super.isObscure,
    super.countryCode,
    super.isChecked,
    super.isEnabled,
  });
}
