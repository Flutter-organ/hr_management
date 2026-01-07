class AuthDto {
  AuthDto({
      int? userId,
      String? identifier, 
      String? loginType, 
      String? otpType, 
      dynamic devOtp,}){
    _userId = userId;
    _identifier = identifier;
    _loginType = loginType;
    _otpType = otpType;
    _devOtp = devOtp;
}

  AuthDto.fromJson(dynamic json) {
    _userId = json['user_id'];
    _identifier = json['identifier'];
    _loginType = json['login_type'];
    _otpType = json['otp_type'];
    _devOtp = json['dev_otp'];
  }
  num? _userId;
  String? _identifier;
  String? _loginType;
  String? _otpType;
  dynamic _devOtp;

  num? get userId => _userId;
  String? get identifier => _identifier;
  String? get loginType => _loginType;
  String? get otpType => _otpType;
  dynamic get devOtp => _devOtp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['identifier'] = _identifier;
    map['login_type'] = _loginType;
    map['otp_type'] = _otpType;
    map['dev_otp'] = _devOtp;
    return map;
  }

}