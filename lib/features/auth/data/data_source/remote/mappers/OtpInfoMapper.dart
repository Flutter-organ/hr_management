
import '../../../../domain/models/OtpInfoModel.dart';
import '../enities/OtpInfoEntity.dart';

class OtpInfoMapper {
  static OtpInfoModel toDomain(OtpInfoEntity entity) {
    return OtpInfoModel(
      identifier: entity.identifier,
      loginType: entity.loginType,
      otpType: entity.otpType,
    );
  }
}