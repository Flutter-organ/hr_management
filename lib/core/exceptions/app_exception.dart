class AppException implements Exception {
  final String message;
  final String? code;
  final int? statusCode;
  final bool isUnauthorized;

  AppException({
    required this.message,
    this.code,
    this.statusCode,
    this.data,
    this.isUnauthorized = false,
    this.originalError,
  });

  @override
  String toString() => 'AppException: $message (code: $code, status: $statusCode)';
}


class NetworkException extends AppException {
  NetworkException(String message)
      : super(
    message: message,
    code: 'NETWORK_ERROR',
  );
}

class TimeoutException extends AppException {
  TimeoutException()
      : super(
    message: 'Connection is slow or timed out. Please try again.',
    code: 'TIMEOUT',
  );
}

class ServerException extends AppException {
  ServerException(String message, int? statusCode)
      : super(
    message: message,
    code: 'SERVER_ERROR',
    statusCode: statusCode,
  );
}

class UnauthorizedException extends AppException {
  UnauthorizedException()
      : super(
    message: 'Session expired. Please sign in again.',
    isUnauthorized: true,
    code: 'UNAUTHORIZED',
  );
}