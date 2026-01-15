import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final bool isCompleted;
  final bool isLoaging;
  final int currentIndex;

  const OnboardingState({
    this.isCompleted = false,
    this.isLoaging = true,
    this.currentIndex = 0,
  });
  @override
  List<Object?> get props => [isCompleted, isLoaging, currentIndex];

  OnboardingState copyWith({
    bool? isCompleted,
    bool? isLoaging,
    int? currentIndex,
  }) {
    return OnboardingState(
      isCompleted: isCompleted ?? this.isCompleted,
      isLoaging: isLoaging ?? this.isLoaging,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
