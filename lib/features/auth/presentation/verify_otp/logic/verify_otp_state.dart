part of 'verify_otp_cubit.dart';

sealed class VerifyOtpState {}

final class VerifyOtpInitial extends VerifyOtpState {}
final class VerifyOtpCodeChanged extends VerifyOtpState {
  final String code;
  VerifyOtpCodeChanged(this.code);
}

final class VerifyOtpLoading extends VerifyOtpState {}

final class VerifyOtpSuccess extends VerifyOtpState {}

final class VerifyOtpFailure extends VerifyOtpState {
  final String message;
  VerifyOtpFailure({required this.message});
}

final class VerifyOtpResent extends VerifyOtpState {}