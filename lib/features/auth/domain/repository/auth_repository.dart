import 'package:fpdart/fpdart.dart';
import '../enitites/User.dart';
import '../failures/failure.dart';

abstract class AuthRepository{
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, Unit>> saveToken(String token);
  Future<Either<Failure, Unit>> clearToken();
  Future<Either<Failure, bool>> hasToken();
  Future<void> register({
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  });
}