import 'package:equatable/equatable.dart';

enum OnboardingStatus { initial, loading, completed, error }

class OnboardingState extends Equatable {
  final OnboardingStatus status;
  final int currentIndex;
  final int totalPages;
  final bool shouldNavigateToFinal;

  const OnboardingState({
    this.status = OnboardingStatus.initial,
    this.currentIndex = 0,
    this.totalPages = 3,
    this.shouldNavigateToFinal = false,
  });

  bool get isLastPage => currentIndex == totalPages - 1;

  @override
  List<Object?> get props => [
    status,
    currentIndex,
    totalPages,
    shouldNavigateToFinal,
  ];

  OnboardingState copyWith({
    OnboardingStatus? status,
    int? currentIndex,
    int? totalPages,
    bool? shouldNavigateToFinal,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
      totalPages: totalPages ?? this.totalPages,
      shouldNavigateToFinal: shouldNavigateToFinal ?? this.shouldNavigateToFinal,
    );
  }
}