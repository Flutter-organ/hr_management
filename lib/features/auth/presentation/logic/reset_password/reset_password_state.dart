import 'package:equatable/equatable.dart';
import '../../../../../core/exceptions/ui_errors.dart';
import '../../../domain/enitites/User.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial();
}

class ResetPasswordLoading extends ResetPasswordState {
  const ResetPasswordLoading();
}

class ResetPasswordSuccess extends ResetPasswordState {
  final User user;

  const ResetPasswordSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class ResetPasswordError extends ResetPasswordState {
  final UiError error;

  const ResetPasswordError(this.error);

  String get message => error.message;

  @override
  List<Object?> get props => [error.message];
}