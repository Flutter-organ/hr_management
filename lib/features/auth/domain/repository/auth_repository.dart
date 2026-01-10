import 'package:fpdart/fpdart.dart';

import '../../data/data_source/remote/dto/AuthDto.dart';
import '../enitites/User.dart';
import '../failures/failure.dart';
import '../usecase/RegisterUseCase.dart';

abstract class AuthRepository {
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, Unit>> saveToken(String token);
  Future<Either<Failure, Unit>> clearToken();
  Future<Either<Failure, bool>> hasToken();
  Future<Either<Failure, bool>> register({
   required RegisterParams registerParams,
  });
  Future<Either<Failure, User>> otp({
    required String email,
    required String code,
    required String type,
  });
}
