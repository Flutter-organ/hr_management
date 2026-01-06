import '../../../../domain/models/OtpInfoModel.dart';

class OtpInfoEntity {
  final int? userId;
  final String identifier;
  final String loginType;
  final String otpType;
  final Map<String, dynamic>? devOtp;

  OtpInfoEntity({
    this.userId,
    required this.identifier,
    required this.loginType,
    required this.otpType,
    this.devOtp,
  });

  factory OtpInfoEntity.fromJson(Map<String, dynamic> json) {
    return OtpInfoEntity(
      userId: json['user_id'] as int?,
      identifier: json['identifier'] as String,
      loginType: json['login_type'] as String,
      otpType: json['otp_type'] as String,
      devOtp: json['dev_otp'] as Map<String, dynamic>?,
    );
  }
}