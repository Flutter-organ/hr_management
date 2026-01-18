import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/domain/failures/failure.dart';
import 'package:hr_management/features/auth/domain/repository/auth_repository.dart';

class LoadIdentifierUseCase {
  AuthRepository _authRepository;
  LoadIdentifierUseCase(this._authRepository);

  Future<Either<Failure, String?>> getIdentifier() async {
    return await _authRepository.getIdentifier();
  }
}
