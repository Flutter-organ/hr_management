import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hr_management/core/domain/failure/domain_failure.dart';
import '../../../features/auth/domain/failures/failure.dart';
import '../exception/ui_errors.dart';

abstract class BaseCubit<STATE> extends Cubit<STATE> {
  BaseCubit(super.initialState);

  Future<void> execute<T>({
    required Future<Either<Failure, T>> Function() call,
    required void Function(T result) onSuccess,
    required void Function(UiError error) onError,
    void Function()? onLoading,
  }) async {
    onLoading?.call();

    final result = await call();

    result.fold((failure) {
      final uiError = _mapFailureToUiError(failure);
      onError(uiError);

      if (failure is SessionExpiredFailure ||
          failure is InvalidCredentialsFailure) {
        if (failure is SessionExpiredFailure) {
          _handleUnauthorized();
        }
      }
    }, (data) => onSuccess(data));
  }

  void updateState(STATE Function(STATE currentState) updater) {
    emit(updater(state));
  }

  UiError _mapFailureToUiError(Failure failure) {
    return switch (failure) {
      NetworkFailure() => const NetworkUiError(),
      TimeoutFailure() => const TimeoutUiError(),
      ServerFailure(:final message) => ServerUiError(message),
      CacheFailure(:final message) => CacheUiError(message),

      InvalidCredentialsFailure(:final message) => InvalidCredentialsUiError(
        message,
      ),
      SessionExpiredFailure(:final message) => UnauthorizedUiError(message),
      UserNotFoundFailure(:final message) => NotFoundUiError(message),
      InvalidOtpFailure(:final message) => InvalidOtpUiError(message),
      OtpExpiredFailure(:final message) => InvalidOtpUiError(message),
      EmailAlreadyExistsFailure(:final message) => AccountExistsUiError(
        message,
      ),
      PhoneAlreadyExistsFailure(:final message) => AccountExistsUiError(
        message,
      ),
      AccountNotVerifiedFailure(:final message) => AccountNotVerifiedUiError(
        message,
      ),
      AccountDisabledFailure(:final message) => AccountDisabledUiError(message),
      TooManyAttemptsFailure(:final message) => TooManyAttemptsUiError(message),

      ValidationFailure(:final message, :final fieldErrors) =>
        ValidationUiError(message: message, fieldErrors: fieldErrors),
      //AuthFailure(:final message) => GenericUiError(message),

      UnknownFailure(:final message) => UnknownUiError(message),
      _ => const UnknownUiError("Unknown error occurred")
    };
  }

  void _handleUnauthorized() {
    // Override in app-level base cubit or specific cubits
  }
}
