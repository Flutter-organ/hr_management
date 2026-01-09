import 'package:hr_management/core/exceptions/ui_errors.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String identifier;

  ForgotPasswordSuccess(this.identifier);
}

class ForgotPasswordError extends ForgotPasswordState {
  final UiError error;

  ForgotPasswordError(this.error);

  String get message => error.message;
}