import '../../../../../../../core/data/exception/app_exception.dart';

class ForgotPasswordResponse {
  final String? identifier;
  final String? otpType;
  final int? devOtp;

  const ForgotPasswordResponse({
    required this.identifier,
    required this.otpType,
    this.devOtp,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    final identifier = json['identifier'] as String?;
    final otpType = json['otp_type'] as String?;

    if (identifier == null || identifier.isEmpty) {
      throw const SerializationException(
        message: 'Missing identifier',

      );
    }
    if (otpType == null || otpType.isEmpty) {
      throw const SerializationException(
        message: 'Missing otp_type',
      );
    }

    return ForgotPasswordResponse(
      identifier: identifier,
      otpType: otpType,
      devOtp: json['dev_otp'] as int? ?? 0,
    );
  }
}
