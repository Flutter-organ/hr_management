
import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/domain/enitites/user.dart';
import 'package:hr_management/features/auth/domain/failures/failure.dart';
import 'package:hr_management/features/auth/domain/repository/auth_repository.dart';

import '../enitites/verify_otp.dart';

class VerifyOTPUseCase {
  final AuthRepository _authRepository;

  const VerifyOTPUseCase(this._authRepository);

  Future<Either<Failure, User>> call({
    required VerifyOTP verifyOtp,
  }) async {
    return await _authRepository.verifyOTP(
      verifyOtp: verifyOtp
    );
  }
}