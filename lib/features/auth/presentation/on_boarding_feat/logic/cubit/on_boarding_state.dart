abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingNotCompleted extends OnboardingState {}

class OnboardingCompleted extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {
  final int currentIndex;
  OnboardingPageChanged(this.currentIndex);
}
