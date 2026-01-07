import '../../../../domain/models/OtpInfo.dart';

class OtpInfoDto {
  final String? identifier;
  final String? loginType;
  final String? otpType;
  final Map<String, dynamic>? devOtp;

  OtpInfoDto({
    required this.identifier,
    required this.loginType,
    required this.otpType,
    this.devOtp,
  });

  factory OtpInfoDto.fromJson(Map<String, dynamic> json) {
    return OtpInfoDto(
      identifier: json['identifier'] as String,
      loginType: json['login_type'] as String,
      otpType: json['otp_type'] as String,
      devOtp: json['dev_otp'] as Map<String, dynamic>?,
    );
  }
}