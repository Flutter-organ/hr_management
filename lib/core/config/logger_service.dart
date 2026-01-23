import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerService {
  static final LoggerService _instance = LoggerService._internal();
  factory LoggerService() => _instance;

  late final Logger _logger;

  LoggerService._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 80,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      // Only log in debug mode
      level: kDebugMode ? Level.debug : Level.off,
    );
  }

  void d(dynamic message) => _logger.d(message);

  void i(dynamic message) => _logger.i(message);

  void w(dynamic message) => _logger.w(message);

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  void logRequest({
    required String method,
    required String path,
    dynamic data,
    Map<String, dynamic>? headers,
  }) {
    _logger.i(
      '🚀 REQUEST\n'
          '├── Method: $method\n'
          '├── Path: $path\n'
          '└── Data: ${_sanitizeData(data)}',
    );
  }

  void logResponse({
    required int? statusCode,
    required String path,
    dynamic data,
  }) {
    _logger.i(
      '✅ RESPONSE\n'
          '├── Status: $statusCode\n'
          '├── Path: $path\n'
          '└── Data: ${_truncateData(data)}',
    );
  }

  void logError({
    required int? statusCode,
    required String path,
    dynamic error,
  }) {
    _logger.e(
      '❌ ERROR\n'
          '├── Status: $statusCode\n'
          '├── Path: $path\n'
          '└── Error: $error',
    );
  }

  static const _sensitiveFields = [
    'password',
    'password_confirmation',
    'token',
    'access_token',
    'refresh_token',
    'api_key',
    'secret',
    'otp',
    'code',
  ];

  dynamic _sanitizeData(dynamic data) {
    if (data == null) return null;

    if (data is Map<String, dynamic>) {
      final sanitized = <String, dynamic>{};
      data.forEach((key, value) {
        if (_sensitiveFields.any((field) => key.toLowerCase().contains(field))) {
          sanitized[key] = '***HIDDEN***';
        } else {
          sanitized[key] = _sanitizeData(value);
        }
      });
      return sanitized;
    }

    if (data is List) {
      return data.map((item) => _sanitizeData(item)).toList();
    }

    return data;
  }

  dynamic _truncateData(dynamic data, {int maxLength = 500}) {
    if (data == null) return null;

    final stringData = data.toString();
    if (stringData.length > maxLength) {
      return '${stringData.substring(0, maxLength)}... [TRUNCATED]';
    }

    return _sanitizeData(data);
  }
}

final logger = LoggerService();