import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/domain/enitites/User.dart';
import 'package:hr_management/features/auth/domain/failures/failure.dart';
import 'package:hr_management/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  Future<Either<Failure, User>> call({
    required String identifier,
    required String password,
    required String loginType,
  }) async {
    return await _authRepository.login(
      identifier: identifier,
      password: password,
      loginType: loginType,
    );
  }
}
