import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  AppConfig._();
  static bool _isInitialized = false;
  static Future<void> init() async {
    if (_isInitialized) return;

    await dotenv.load(fileName: '.env');
    _isInitialized = true;
  }

  static void _ensureInitialized() {
    if (!_isInitialized) {
      throw Exception(
        'AppConfig is not initialized. '
        'Call AppConfig.init() before accessing configuration values.',
      );
    }
  }


  static String get apiBaseUrl {
    _ensureInitialized();
    return dotenv.env['API_BASE_URL'] ?? 'https://localhost:8080';
  }

  static String get appName {
    _ensureInitialized();
    return dotenv.env['APP_NAME'] ?? 'HR App';
  }

  static int get timeout {
    _ensureInitialized();
    final value = dotenv.env['TIMEOUT_SECONDS'];
    return int.tryParse(value ?? '') ?? 10;
  }
  static String get environment {
    _ensureInitialized();
    return dotenv.env['ENV']?.toLowerCase() ?? 'development';
  }
  static bool get isProduction => environment == 'production';
  static bool get isDevelopment => environment == 'development';
  static bool get isStaging => environment == 'staging';
}
