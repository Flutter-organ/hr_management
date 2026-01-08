import 'package:hr_management/features/auth/domain/enitites/User.dart';

abstract class LoginStates {}

final class LoginInitial extends LoginStates {}

final class LoginLoading extends LoginStates {}

final class LoginSuccess extends LoginStates {
  final User user;
  LoginSuccess({required this.user});
}

final class LoginFailure extends LoginStates {
  final String message;

  LoginFailure({required this.message});
}
