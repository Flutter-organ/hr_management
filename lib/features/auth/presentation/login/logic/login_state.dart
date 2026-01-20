import 'package:equatable/equatable.dart';
import '../../../domain/enitites/user.dart';

class LoginState extends Equatable {
  final String identifier;
  final String password;
  final String countryCode;
  final String? identifierError;
  final String? passwordError;

  final bool isLoading;
  final bool isSuccess;
  final User? user;
  final String? apiError;
  final bool clearIdentifierError;
  final bool clearPasswordError;
  final bool clearApiError;

  final bool rememberMe;

  final String? savedIdentifier;

  const LoginState({
    this.identifier = '',
    this.password = '',
    this.countryCode = '+20',
    this.identifierError,
    this.passwordError,
    this.isLoading = false,
    this.isSuccess = false,
    this.user,
    this.apiError,
    this.rememberMe = false,
    this.savedIdentifier,
    this.clearIdentifierError = false,
    this.clearPasswordError = false,
    this.clearApiError = false,
  });

  bool get isFormValid =>
      identifier.trim().isNotEmpty &&
          password.isNotEmpty;

  LoginState copyWith({
    String? identifier,
    String? password,
    String? countryCode,
    String? identifierError,
    String? passwordError,
    bool? isLoading,
    bool? isSuccess,
    User? user,
    String? apiError,
    bool? rememberMe,
    String? savedIdentifier,
    bool clearIdentifierError = false,
    bool clearPasswordError = false,
    bool clearApiError = false,
  }) {
    return LoginState(
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
      countryCode: countryCode ?? this.countryCode,
      identifierError: clearIdentifierError
          ? null
          : (identifierError ?? this.identifierError),
      passwordError: clearPasswordError
          ? null
          : (passwordError ?? this.passwordError),
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user ?? this.user,
      apiError: clearApiError ? null : (apiError ?? this.apiError),
      rememberMe: rememberMe ?? this.rememberMe,
      savedIdentifier: savedIdentifier ?? this.savedIdentifier,
      clearIdentifierError: clearIdentifierError,
      clearPasswordError: clearPasswordError,
      clearApiError: clearApiError,
    );
  }

  @override
  List<Object?> get props => [
    identifier,
    password,
    countryCode,
    identifierError,
    passwordError,
    isLoading,
    isSuccess,
    user,
    apiError,
    rememberMe,
    savedIdentifier,
    clearIdentifierError,
    clearPasswordError,
    clearApiError,
  ];
}