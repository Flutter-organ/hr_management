class ForgotPasswordResponse {
  final String identifier;
  final String otpType;

  const ForgotPasswordResponse({
    required this.identifier,
    required this.otpType,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      identifier: json['identifier'] as String,
      otpType: json['otp_type'] as String,
    );
  }
}