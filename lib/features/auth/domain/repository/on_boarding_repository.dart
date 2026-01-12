abstract class OnboardingRepository {
  Future<void> saveOnboardingCompleted();
  Future<bool> isOnboardingCompleted();
}
