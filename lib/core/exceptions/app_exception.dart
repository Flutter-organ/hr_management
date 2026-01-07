sealed class AppException implements Exception {
  final String message;
  final String? code;
  final int? statusCode;
  final bool isUnauthorized;

  const AppException({
    required this.message,
    this.code,
    this.statusCode,
    this.isUnauthorized = false,
  });

  @override
  String toString() => 'AppException: $message (code: $code, status: $statusCode)';
}

class NetworkException extends AppException {
  const NetworkException({String message = 'No internet connection'})
      : super(
    message: message,
    code: 'NETWORK_ERROR',
  );
}

class ConnectionTimeoutException extends AppException {
  const ConnectionTimeoutException({
    String message = 'Connection timed out. Please try again.',
}) : super(
    message: message,
    code: 'TIMEOUT',
  );
}

class ServerException extends AppException {
  const ServerException({
    required super.message,
    String? code,
    int? statusCode,
  }) : super(
    code: code,
    statusCode: statusCode,
  );
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({
    String message = 'Session expired. Please sign in again.',
    int? statusCode,
    String? code,
  }) : super(
    message: message,
    isUnauthorized: true,
    code: code,
    statusCode: statusCode,
  );
}

class CacheException extends AppException {
  const CacheException({String message = 'Failed to access local storage'})
      : super(
    message: message,
    code: 'CACHE_ERROR',
  );
}

class ValidationException extends AppException {
  final Map<String, List<String>>? errors;

  const ValidationException({
    required super.message,
    this.errors,
  }) : super(
    code: 'VALIDATION_ERROR',
  );

  String? getFieldError(String field) => errors?[field]?.firstOrNull;

  String get allErrors => errors?.values.expand((e) => e).join('\n') ?? message;
}

class UnknownException extends AppException {
  const UnknownException({String message = 'An unexpected error occurred'})
      : super(
    message: message,
    code: 'UNKNOWN_ERROR',
  );
}