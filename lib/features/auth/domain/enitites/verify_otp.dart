import 'package:hr_management/features/auth/domain/enitites/verification_type.dart';

class VerifyOTP {
    VerifyOTP({
        required this.identifier,
        required this.code,
        required this.type,
    });

    String identifier;
    String code;
    VerificationType type;
}
