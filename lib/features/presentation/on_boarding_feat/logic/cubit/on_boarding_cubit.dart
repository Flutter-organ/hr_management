import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/features/auth/domain/use_cases/on_boarding_use_case.dart';
import 'package:hr_management/features/presentation/on_boarding_feat/logic/cubit/on_boarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final CompleteOnboardingUseCase completeOnboardingUseCase;

  OnboardingCubit(this.completeOnboardingUseCase) : super(OnboardingInitial());

  Future<bool> checkOnboardingStatus() async {
    final isCompleted = await completeOnboardingUseCase.check();
    return isCompleted;
  }

  Future<void> completeOnboarding() async {
    await completeOnboardingUseCase();
    emit(OnboardingCompleted());
  }
}
