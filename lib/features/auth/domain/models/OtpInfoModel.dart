class OtpInfoModel {
  final int? userId;
  final String identifier;
  final String loginType;
  final String otpType;
  final Map<String, dynamic>? devOtp;

  const OtpInfoModel({
    this.userId,
    required this.identifier,
    required this.loginType,
    required this.otpType,
    this.devOtp,
  });
}