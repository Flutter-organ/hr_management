class ApiConstants {
  ApiConstants._();

  static const String contentType = 'application/json';
  static const String accept = 'application/json';
  static const String apiKeyHeader = 'x-api-key';
  static const String authorizationHeader = 'Authorization';

  static const String register = '/api/auth/register';
  static const String verifyOtp = '/api/auth/verify-otp';
  static const String login = '/api/auth/login';
  static const String forgotPassword = '/api/auth/forgot-password';
  static const String verifyForgotPasswordOtp =
      '/api/auth/verify-forgot-password-otp';
  static const String logout = '/api/auth/logout';
  static const String logoutAll = '/api/auth/logout-all';
  static const String deleteAccount = '/api/auth/delete-account';
  static const String currentUser = '/api/user';

  static const String tokenKey = 'token';
  static const String multipartContentType = 'multipart/form-data';

  static const String attendanceHistory = '/api/attendance/history';
  static const String attendanceCheckIn = '/api/attendance/check-in';
  static const String attendanceCheckOut = '/api/attendance/check-out';
  static const String attendanceToday = '/api/attendance/today';


}
