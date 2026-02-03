import 'package:equatable/equatable.dart';

enum ClockInStatus  {
  initial,
  submitting,
  success,
  error,
}

class ConfirmationCameraState extends Equatable {
  final ClockInStatus status;

  final Map<String, double> location;

  final String dateTime;

  final String? notes;

  final String? errorMessage;

  final String? successMessage;

  const ConfirmationCameraState({
    this.status = ClockInStatus.initial,
    required this.location,
    required this.dateTime,
    this.notes,
    this.errorMessage,
    this.successMessage,
  });

  ConfirmationCameraState copyWith({
    ClockInStatus? status,
    Map<String, double>? location,
    String? dateTime,
    String? notes,
    String? errorMessage,
    String? successMessage,
  }) {
    return ConfirmationCameraState(
      status: status ?? this.status,
      location: location ?? this.location,
      dateTime: dateTime ?? this.dateTime,
      notes: notes ?? this.notes,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  bool get isSubmitting => status == ClockInStatus.submitting;

  bool get isSuccess => status == ClockInStatus.success;

  bool get hasError => status == ClockInStatus.error;

  @override
  List<Object?> get props => [
    status,
    location,
    dateTime,
    notes,
    errorMessage,
    successMessage,
  ];
}