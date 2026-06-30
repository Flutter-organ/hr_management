import '../../../../core/data/exception/app_exception.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/failure/payroll_failure.dart';

abstract final class PayrollFailureMapper {

  static Failure? fromException(AppException exception) {
    return switch (exception) {
      NotFoundException() ||
      ServerException()   =>
          _fromErrorCode(exception),

      _ => null,
    };
  }

  static Failure? _fromErrorCode(AppException exception) {
    final code = exception.apiError?.errorCode?.toUpperCase();
    final message = exception.message;

    return switch (code) {
      'PAYROLL_NOT_FOUND' => PayrollNotFoundFailure(message: message),
      _                   => null,
    };
  }
}