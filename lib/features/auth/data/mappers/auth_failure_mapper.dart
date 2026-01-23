import '../../../../core/data/exception/app_exception.dart';
import '../../domain/failures/failure.dart';

class AuthFailureMapper {
  const AuthFailureMapper._();

  static Failure mapException(Object exception) {
    if (exception is ServerException) {
      return _mapServerException(exception);
    }

    if (exception is NetworkException) {
      return const NetworkFailure();
    }

    if (exception is ConnectionTimeoutException) {
      return const TimeoutFailure();
    }

    if (exception is CacheException) {
      return CacheFailure(exception.message);
    }

    if (exception is UnauthorizedException) {
      return const SessionExpiredFailure();
    }

    if (exception is ValidationException) {
      return ValidationFailure(
        message: exception.message,
        fieldErrors: exception.errors,
      );
    }

    if (exception is AppException) {
      return UnknownFailure(exception.message);
    }

    return UnknownFailure(exception.toString());
  }

  static Failure _mapServerException(ServerException exception) {
    switch (exception.statusCode) {
      case 401:
        return const InvalidCredentialsFailure();
      case 403:
        return const SessionExpiredFailure();
      case 404:
        return const UserNotFoundFailure();
      case 409:
        return const EmailAlreadyExistsFailure();
      case 422:
        return const ValidationFailure();
      case 429:
        return const TooManyAttemptsFailure();
      default:
        return ServerFailure(exception.message);
    }
  }
}