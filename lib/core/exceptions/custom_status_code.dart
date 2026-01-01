import 'package:collection/collection.dart';

enum CustomStatusCode {
  ok(200),
  created(201),

  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  unprocessableEntity(422),
  tooManyRequests(429),

  internalServerError(500),
  notImplemented(501),
  serviceUnavailable(503),
  gatewayTimeout(504);

  const CustomStatusCode(this.code);

  final int code;

  static CustomStatusCode? fromCode(int? code) {
    return CustomStatusCode.values.firstWhereOrNull((status) => status.code == code);
  }

  bool get isSuccess => code >= 200 && code < 300;

  bool get isClientError => code >= 400 && code < 500;

  bool get isServerError => code >= 500 && code < 600;

  bool get isUnauthorized => code == 401 || code == 403;
}