import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/domain/failures/failure.dart';

import '../repository/on_boarding_repository.dart';

class CompleteOnboardingUseCase {
  final OnboardingRepository _repository;

  CompleteOnboardingUseCase(this._repository);

  Future<Either<Failure, Unit>> call() {
    return _repository.saveOnboardingCompleted();
  }
}