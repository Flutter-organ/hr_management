import 'package:equatable/equatable.dart';
import 'package:hr_management/core/exceptions/ui_errors.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {
  const ForgotPasswordInitial();
}

class ForgotPasswordLoading extends ForgotPasswordState {
  const ForgotPasswordLoading();
}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String identifier;

  const ForgotPasswordSuccess(this.identifier);

  @override
  List<Object?> get props => [identifier];
}

class ForgotPasswordError extends ForgotPasswordState {
  final UiError error;

  const ForgotPasswordError(this.error);

  String get message => error.message;

  @override
  List<Object?> get props => [error.message];
}