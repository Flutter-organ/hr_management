class ForgotPasswordResponse {
  final String identifier;
  final String otpType;
  final String? devOtp;

  const ForgotPasswordResponse({
    required this.identifier,
    required this.otpType,
    this.devOtp,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      identifier: json['identifier'] as String,
      otpType: json['otp_type'] as String,
      devOtp: json['dev_otp'] as String?,
    );
  }
}