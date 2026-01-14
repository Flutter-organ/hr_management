import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import '../../features/auth/domain/failures/failure.dart';
import '../exceptions/ui_errors.dart';

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

    result.fold(
          (failure) {
        final uiError = _mapFailureToUiError(failure);
        onError(uiError);

        if (failure is SessionExpiredFailure || failure is InvalidCredentialsFailure) {
          if (failure is SessionExpiredFailure) {
            _handleUnauthorized();
          }
        }
      },
          (data) => onSuccess(data),
    );
  }

  void updateState(STATE Function(STATE currentState) updater) {
    emit(updater(state));
  }

  UiError _mapFailureToUiError(Failure failure) {
    return switch (failure) {
      NetworkFailure() => const NetworkUiError(),
      TimeoutFailure() => const TimeoutUiError(),
      ServerFailure() => ServerUiError(failure.message),
      CacheFailure() => CacheUiError(failure.message),
      InvalidCredentialsFailure() => const InvalidCredentialsUiError(),
      SessionExpiredFailure() => const UnauthorizedUiError(),
      UserNotFoundFailure() => const NotFoundUiError(),
      InvalidOtpFailure() => const InvalidOtpUiError(),
      OtpExpiredFailure() => const InvalidOtpUiError(),
      EmailAlreadyExistsFailure() => const AccountExistsUiError(),
      PhoneAlreadyExistsFailure() => const AccountExistsUiError(),
      AccountNotVerifiedFailure() => const AccountNotVerifiedUiError(),
      AccountDisabledFailure() => const AccountDisabledUiError(),
      TooManyAttemptsFailure() => const TooManyAttemptsUiError(),
      ValidationFailure(:final fieldErrors) => ValidationUiError(
        message: failure.message,
        fieldErrors: fieldErrors,
      ),
      UnknownFailure() => const UnknownUiError(),
    };
  }

  void _handleUnauthorized() {
    // Override in app-level base cubit or specific cubits
  }
}