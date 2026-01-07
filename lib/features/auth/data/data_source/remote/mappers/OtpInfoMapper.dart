
import '../../../../domain/models/OtpInfo.dart';
import '../enities/OtpInfoDto.dart';

class OtpInfoMapper {
  static OtpInfo toDomain(OtpInfoDto entity) {
    return OtpInfo(
      identifier: entity.identifier,
      loginType: entity.loginType,
      otpType: entity.otpType,
    );
  }
}