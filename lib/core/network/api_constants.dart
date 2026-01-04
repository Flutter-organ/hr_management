class ApiConstants {
  ApiConstants._();

  static const String productionBaseUrl = 'https://api.mohammedzom.online';
  static const String localBaseUrl = 'http://localhost:8000';

  static const String baseUrl = productionBaseUrl;

  static const String apiKey = 'hqJrRzmRCv3aOnUquOTXyv6TN084pxWv';

  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  static const String contentType = 'application/json';
  static const String accept = 'application/json';
  static const String apiKeyHeader = 'x-api-key';
  static const String authorizationHeader = 'Authorization';

  static const String register = '/api/auth/register';
  static const String verifyOtp = '/api/auth/verify-otp';
  static const String login = '/api/auth/login';
  static const String forgotPassword = '/api/auth/forgot-password';
  static const String verifyForgotPasswordOtp = '/api/auth/verify-forgot-password-otp';
  static const String logout = '/api/auth/logout';
  static const String logoutAll = '/api/auth/logout-all';
  static const String deleteAccount = '/api/auth/delete-account';

  static const String currentUser = '/api/user';

  static const String token_key = 'token';

  static const String content_Type = 'multipart/form-data';

}