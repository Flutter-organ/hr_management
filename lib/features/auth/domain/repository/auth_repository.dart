import 'package:fpdart/fpdart.dart';
import '../enitites/User.dart';
import '../enitites/login_type.dart';
import '../failures/failure.dart';

abstract class AuthRepository{
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, Unit>> saveToken(String token);
  Future<Either<Failure, Unit>> clearToken();
  Future<Either<Failure, bool>> hasToken();

  Future<Either<Failure, String>> forgotPassword({
    required String identifier,
    required LoginType loginType,
  });

  Future<Either<Failure, User>> resetPassword({
    required String identifier,
    required String code,
    required String password,
    required String passwordConfirmation,
  });
}