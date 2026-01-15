import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_management/core/base_viewmodel/base_cubit.dart';
import 'package:hr_management/features/auth/domain/failures/failure.dart';
import 'package:hr_management/features/auth/domain/use_cases/on_boarding_use_case.dart';
import 'package:hr_management/features/auth/presentation/on_boarding_feat/logic/cubit/on_boarding_state.dart';

class OnboardingCubit extends BaseCubit<OnboardingState> {
  final CompleteOnboardingUseCase completeOnboardingUseCase;
  final pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  OnboardingCubit(this.completeOnboardingUseCase) : super(OnboardingInitial());

  Future<void> checkOnboardingStatus() async {
    await execute<bool>(
      call: () => completeOnboardingUseCase.check(),
      onSuccess: (bool) => updateState((currentState) => OnboardingCompleted()),
      onError: (bool) =>
          updateState((currentState) => OnboardingNotCompleted()),
    );
  }

  Future<void> completeOnboarding() async {
    await execute<Unit>(
      call: () => completeOnboardingUseCase.call(),
      onSuccess: (unit) => updateState((currentState) => OnboardingCompleted()),
      onError: (unit) =>
          updateState((currentState) => OnboardingNotCompleted()),
    );
  }

  void nextPage() {
    if (currentIndex < 2) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      updateState((currentState) => OnboardingPageChanged(currentIndex));
    }
  }
}
