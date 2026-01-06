class AuthResponseModel<T> {
  final bool success;
  final String message;
  final T? data;
  final String? errorCode;

  const AuthResponseModel({
    required this.success,
    required this.message,
    this.data,
    this.errorCode,
  });

  bool get isSuccess => success;
  bool get hasError => !success && errorCode != null;
}