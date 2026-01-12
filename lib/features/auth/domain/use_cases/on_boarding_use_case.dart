import 'package:hr_management/features/auth/domain/repository/on_boarding_repository.dart';

class CompleteOnboardingUseCase {
  final OnboardingRepository repository;

  CompleteOnboardingUseCase(this.repository);

  Future<void> call() {
    return repository.saveOnboardingCompleted();
  }

  Future<bool> check() {
    return repository.isOnboardingCompleted();
  }
}
