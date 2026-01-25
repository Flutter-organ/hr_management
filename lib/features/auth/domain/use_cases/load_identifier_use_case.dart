import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/domain/failures/failure.dart';
import 'package:hr_management/features/auth/domain/repository/auth_repository.dart';

class LoadIdentifierUseCase {
  final AuthRepository _repository;

  const LoadIdentifierUseCase(this._repository);

  Future<Either<Failure, String?>> call() async {
    return await _repository.getIdentifier();
  }
}
