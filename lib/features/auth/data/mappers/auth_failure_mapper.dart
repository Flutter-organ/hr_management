import '../../../../core/data/exception/app_exception.dart';
import '../../domain/failures/failure.dart';

class AuthFailureMapper {
  const AuthFailureMapper._();

  static AuthFailure? mapException(AppException exception) {
    switch (exception) {
      case UnauthorizedException():
        return SessionExpiredFailure(message: exception.message);

      case InvalidCredentialsException():
        return InvalidCredentialsFailure(message: exception.message);

      case ServerException():
      case BadRequestException():
      case ForbiddenException():
        return _mapErrorCodeException(exception);

      default:
        return null;
    }
  }

  // static AuthFailure? _mapValidationException(ValidationException exception) {
  //   final errors = exception.apiError?.validationErrors?.fields;
  //   final message = exception.message;
  //
  //   if (errors != null) {
  //     if (_containsError(errors, 'email', ['already', 'taken', 'exists'])) {
  //       return EmailAlreadyExistsFailure(
  //         message: errors['email']?.first ?? message,
  //       );
  //     }
  //
  //     if (_containsError(errors, 'phone', ['already', 'taken', 'exists'])) {
  //       return PhoneAlreadyExistsFailure(
  //         message: errors['phone']?.first ?? message,
  //       );
  //     }
  //
  //     if (_containsError(errors, 'code', ['invalid', 'incorrect', 'wrong'])) {
  //       return InvalidOtpFailure(message: errors['code']?.first ?? message);
  //     }
  //
  //     if (_containsError(errors, 'code', ['expired'])) {
  //       return OtpExpiredFailure(
  //         message: errors['code']?.first ?? message,
  //       );
  //     }
  //   }
  //
  //   return null;
  // }

  // static bool _containsError(
  //   Map<String, List<String>> errors,
  //   String field,
  //   List<String> keywords,
  // ) {
  //   final fieldErrors = errors[field];
  //   if (fieldErrors == null || fieldErrors.isEmpty) return false;
  //
  //   final errorText = fieldErrors.join(' ').toLowerCase();
  //   return keywords.any((keyword) => errorText.contains(keyword.toLowerCase()));
  // }

  static AuthFailure? _mapErrorCodeException(AppException exception) {
    final code = exception.apiError?.errorCode?.toUpperCase();
    final message = exception.message;

    switch (code) {
      case 'USER_NOT_FOUND':
      case 'MODEL_NOT_FOUND':
        return UserNotFoundFailure(message: message);
      case 'ACCOUNT_DISABLED':
        return AccountDisabledFailure(message: message);
      case 'ACCOUNT_NOT_VERIFIED':
        return AccountNotVerifiedFailure(message: message);
      case 'EMAIL_EXISTS':
        return EmailAlreadyExistsFailure(message: message);
      case 'PHONE_EXISTS':
        return PhoneAlreadyExistsFailure(message: message);
      case 'SAME_PASSWORD':
        return SamePasswordFailure(message: message);
      case 'INVALID_CURRENT_PASSWORD':
      case 'WRONG_PASSWORD':
        return InvalidCurrentPasswordFailure(message: message);
      case 'CHANGE_PASSWORD_FAILED':
        return ChangePasswordFailure(message: message);
    }
    return null;
  }
}
