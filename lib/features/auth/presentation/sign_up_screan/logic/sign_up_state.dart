import 'package:equatable/equatable.dart';


sealed class SignUpStates {}

class InitialState extends SignUpStates {}

class LoadingState extends SignUpStates {}

class SuccessState extends SignUpStates {}

class FailureState extends SignUpStates {
  final String message;

  FailureState({required this.message});
}

class CheckInputValidationState extends SignUpStates {}

class CountryCodeChangedState extends SignUpStates {
  final String countryCode;

  CountryCodeChangedState(this.countryCode);
}

class ShowOrHidePasswordState extends SignUpStates {}

class ToggleCheckedTermAndConditionsState extends SignUpStates {}