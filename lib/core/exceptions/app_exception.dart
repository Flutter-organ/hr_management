import 'custom_status_code.dart';

class AppException implements Exception {
  final String message;
  final CustomStatusCode? statusCode;
  final bool isUnauthorized;
  final dynamic data;

  AppException({
    required this.message,
    this.statusCode,
    this.isUnauthorized = false,
    this.data,
  });

  int? get statusCodeValue => statusCode?.code;

  @override
  String toString() {
    final statusText = statusCode != null
        ? '${statusCode!.name} (${statusCode!.code})'
        : 'unknown';
    return 'AppException: $message (status: $statusText)';
  }
}


