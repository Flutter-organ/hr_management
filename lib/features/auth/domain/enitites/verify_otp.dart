import 'package:equatable/equatable.dart';
import 'package:hr_management/features/auth/domain/enitites/verification_type.dart';

class VerifyOTP extends Equatable {
    const VerifyOTP({
        required this.identifier,
        required this.code,
        required this.type,
    });

    final String identifier;
    final String code;
    final VerificationType type;

  @override
  List<Object?> get props => [identifier, code, type];
}
