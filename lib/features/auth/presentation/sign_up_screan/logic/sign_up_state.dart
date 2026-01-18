import 'package:equatable/equatable.dart';

class SignUpUiState extends Equatable {
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final String countryCode;
  final bool isCheckedTermAndConditions;
  final bool isEnableSignUpButton;
  final bool isObscurePassWord;
  final bool isRegistered;
  final String? errorMessage;

  const SignUpUiState({
    this.email = '',
    this.phone = '',
    this.password = '',
    this.confirmPassword = '',
    this.countryCode = '20',
    this.isCheckedTermAndConditions = false,
    this.isEnableSignUpButton = false,
    this.isObscurePassWord = true,
    this.isRegistered = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
    email,
    phone,
    password,
    confirmPassword,
    countryCode,
    isCheckedTermAndConditions,
    isEnableSignUpButton,
    isObscurePassWord,
    isRegistered,
    errorMessage,
  ];

  SignUpUiState copyWith({
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
    String? countryCode,
    bool? isCheckedTermAndConditions,
    bool? isEnableSignUpButton,
    bool? isObscurePassWord,
    bool? isRegistered,
    String? errorMessage,
  }) {
    return SignUpUiState(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      countryCode: countryCode ?? this.countryCode,
      isCheckedTermAndConditions:
      isCheckedTermAndConditions ?? this.isCheckedTermAndConditions,
      isEnableSignUpButton:
      isEnableSignUpButton ?? this.isEnableSignUpButton,
      isObscurePassWord: isObscurePassWord ?? this.isObscurePassWord,
      isRegistered: isRegistered ?? this.isRegistered,
      errorMessage: errorMessage,
    );
  }
}
