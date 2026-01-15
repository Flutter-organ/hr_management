import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/domain/enitites/User.dart';
import '../failures/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, Unit>> saveToken(String token);
  Future<Either<Failure, Unit>> clearToken();
  Future<Either<Failure, bool>> hasToken();

  Future<Either<Failure, User>> login({
    required String identifier,
    required String password,
    required String loginType,
    required bool isRememberd,
  });

  Future<Either<Failure, Unit>> saveIdentifier(String mail);
  Future<Either<Failure, String?>> getIdentifier();
  Future<Either<Failure, Unit>> clearIdentifier();
}
