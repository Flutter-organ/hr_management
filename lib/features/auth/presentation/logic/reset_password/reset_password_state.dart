import '../../../../../core/exceptions/ui_errors.dart';
import '../../../domain/enitites/User.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final User user;

  ResetPasswordSuccess(this.user);
}

class ResetPasswordError extends ResetPasswordState {
  final UiError error;

  ResetPasswordError(this.error);

  String get message => error.message;
}