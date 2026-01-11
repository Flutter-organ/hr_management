
import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/domain/enitites/User.dart';
import 'package:hr_management/features/auth/domain/failures/failure.dart';
import 'package:hr_management/features/auth/domain/repository/auth_repository.dart';

class OtpUseCase {
  AuthRepository _authRepository;



  OtpUseCase(this._authRepository);

  Future<Either<Failure, User>> call({
    required String email,
    required String code,
    required String type,
  }) async {
    return await _authRepository.otp(email: email, code: code, type: type);
  }
}