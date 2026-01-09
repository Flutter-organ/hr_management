import 'package:equatable/equatable.dart';


sealed class SignUpStates {}

class InitialState extends SignUpStates {}
class LoadingState extends SignUpStates {}
class SuccessState extends SignUpStates {}
class FailureState extends SignUpStates {
  final String? message;

  FailureState(this.message);
}
class CheckInputValidationState extends SignUpStates {}
