sealed class UiError {
  final String message;
  const UiError(this.message);
}

class NetworkError extends UiError {
  const NetworkError([super.message = 'Please check your internet connection']);
}

class TimeoutError extends UiError {
  const TimeoutError([super.message = 'Connection timed out. Please try again']);
}

class UnauthorizedError extends UiError {
  const UnauthorizedError([super.message = 'Session expired. Please sign in again']);
}

class ServerError extends UiError {
  const ServerError([super.message = 'Something went wrong. Please try again later']);
}

class ValidationError extends UiError {
  final Map<String, List<String>>? fieldErrors;

  const ValidationError({String message='Validation error',
    this.fieldErrors,
  }): super(message);

  String? getFieldError(String field) => fieldErrors?[field]?.firstOrNull;
}

class NotFoundError extends UiError {
  const NotFoundError([super.message = 'Resource not found']);
}

class CacheError extends UiError {
  const CacheError([super.message = 'Failed to load data']);
}

class UnknownError extends UiError {
  const UnknownError([super.message = 'An unexpected error occurred']);
}