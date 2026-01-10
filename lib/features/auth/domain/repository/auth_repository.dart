import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, Unit>> saveToken(String token);
  Future<Either<Failure, Unit>> clearToken();
  Future<Either<Failure, bool>> hasToken();
  Future<Either<Failure, Unit>> setOnBoardingStatus({required bool value});
  Future<Either<Failure, bool>> getOnBoardingStatus();
}
