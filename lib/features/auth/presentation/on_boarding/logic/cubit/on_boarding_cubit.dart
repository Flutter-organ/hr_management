import 'package:fpdart/fpdart.dart';
import 'package:hr_management/core/base_viewmodel/base_cubit.dart';
import '../../../../domain/use_cases/check_onboarding_status_use_case.dart';
import '../../../../domain/use_cases/complete_onboarding_use_case.dart';
import 'on_boarding_state.dart';


class OnboardingCubit extends BaseCubit<OnboardingState> {
  final CompleteOnboardingUseCase _completeOnboardingUseCase;
  final CheckOnboardingStatusUseCase _checkOnboardingStatusUseCase;

  OnboardingCubit({
    required CompleteOnboardingUseCase completeOnboardingUseCase,
    required CheckOnboardingStatusUseCase checkOnboardingStatusUseCase,
  })  : _completeOnboardingUseCase = completeOnboardingUseCase,
        _checkOnboardingStatusUseCase = checkOnboardingStatusUseCase,
        super(const OnboardingState());

  Future<void> onNextPressed() async {
    if (state.isLastPage) {
      await _completeAndNavigate();
    } else {
      _goToNextPage();
    }
  }

  Future<void> onSkipPressed() async {
    await _completeAndNavigate();
  }

  void onPageChanged(int index) {
    updateState(
          (currentState) => currentState.copyWith(currentIndex: index),
    );
  }

  void onNavigationHandled() {
    updateState(
          (currentState) => currentState.copyWith(shouldNavigateToFinal: false),
    );
  }

  Future<void> checkOnboardingStatus() async {
    await execute<bool>(
      onLoading: () => updateState(
            (currentState) => currentState.copyWith(status: OnboardingStatus.loading),
      ),
      call: _checkOnboardingStatusUseCase.call,
      onSuccess: (isCompleted) => updateState(
            (currentState) => currentState.copyWith(
          status: OnboardingStatus.initial,
          shouldNavigateToFinal: isCompleted,
        ),
      ),
      onError: (error) => updateState(
            (currentState) => currentState.copyWith(status: OnboardingStatus.error),
      ),
    );
  }

  Future<void> _completeAndNavigate() async {
    await execute<Unit>(
      onLoading: () => updateState(
            (currentState) => currentState.copyWith(status: OnboardingStatus.loading),
      ),
      call: _completeOnboardingUseCase.call,
      onSuccess: (_) => updateState(
            (currentState) => currentState.copyWith(
          status: OnboardingStatus.completed,
          shouldNavigateToFinal: true,
        ),
      ),
      onError: (error) => updateState(
            (currentState) => currentState.copyWith(status: OnboardingStatus.error),
      ),
    );
  }

  void _goToNextPage() {
    updateState(
          (currentState) => currentState.copyWith(
        currentIndex: currentState.currentIndex + 1,
      ),
    );
  }
}