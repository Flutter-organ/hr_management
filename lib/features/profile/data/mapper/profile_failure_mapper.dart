import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/failure/failure.dart';

abstract final class ProfileFailureMapper {

  static Failure? fromException(AppException exception) {
    return switch (exception) {
      ValidationException() => ValidationFailure(
        message: exception.message,
        errors: exception.apiError?.validationErrors,
      ),

      BadRequestException() ||
      ServerException()     ||
      ForbiddenException()  ||
      NotFoundException()   =>
          _fromErrorCode(exception),
      _ => null,
    };
  }

  static Failure? _fromErrorCode(AppException exception) {
    final code = exception.apiError?.errorCode?.toUpperCase();
    final message = exception.message;

    return switch (code) {
      'PROFILE_NOT_COMPLETED'        => ProfileNotCompletedFailure(message: message),
      'PROFILE_ALREADY_EXISTS'       => ProfileAlreadyExistsFailure(message: message),
      'PROFILE_IMAGE_UPLOAD_FAILED'  => ProfileImageUploadFailure(message: message),
      _                              => null,
    };
  }
}