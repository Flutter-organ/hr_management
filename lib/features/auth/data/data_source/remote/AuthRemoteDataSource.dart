import 'dto/CurrentUser.dart';

abstract class AuthRemoteDataSource {
  Future<void> register({
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  });

}
