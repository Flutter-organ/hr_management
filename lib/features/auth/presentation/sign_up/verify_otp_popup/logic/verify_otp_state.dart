import 'package:equatable/equatable.dart';

class VerifyOtpUiState extends Equatable {
  final String identifier;
  final String code;
  final String type;
  final bool isLoading;
  final bool isVerified;
  final String? errorMessage;

  VerifyOtpUiState({
    this.identifier = '',
    this.code = '',
    this.type = '',
    this.isLoading = false,
    this.isVerified = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [identifier, code, type, isLoading, isVerified, errorMessage];

  VerifyOtpUiState copyWith({
    String? identifier,
    String? code,
    String? type,
    bool? isLoading,
    bool? isVerified,
    String? errorMessage,
  }) {
    return VerifyOtpUiState(
      identifier: identifier ?? this.identifier,
      code: code ?? this.code,
      type: type ?? this.type,
      isVerified: isVerified ?? this.isVerified,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
