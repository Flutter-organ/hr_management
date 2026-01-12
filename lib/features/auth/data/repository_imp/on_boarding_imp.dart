import 'package:hr_management/features/auth/data/data_source/local/onboarding_local_data_source%20.dart';
import 'package:hr_management/features/auth/domain/repository/on_boarding_repository.dart';

class OnBoardingImp implements OnboardingRepository {
  final OnboardingLocalDataSource _localDataSource;
  OnBoardingImp({required OnboardingLocalDataSource localDataSource})
    : _localDataSource = localDataSource;
  @override
  Future<bool> isOnboardingCompleted() {
    return _localDataSource.isOnboardingCompleted();
  }

  @override
  Future<void> saveOnboardingCompleted() {
    return _localDataSource.saveOnboardingCompleted();
  }
}
