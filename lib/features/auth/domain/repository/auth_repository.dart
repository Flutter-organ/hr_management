import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/domain/enitites/verify_otp.dart';

import '../../data/data_source/remote/dto/AuthDto.dart';
import '../enitites/Register.dart';
import '../enitites/User.dart';
import '../failures/failure.dart';
import '../usecase/RegisterUseCase.dart';

abstract class AuthRepository {
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, Unit>> saveToken(String token);
  Future<Either<Failure, Unit>> clearToken();
  Future<Either<Failure, bool>> hasToken();
  Future<Either<Failure, bool>> register({
   required Register register ,
  });
  Future<Either<Failure, User>> otp({
   required VerifyOTP verifyOtp
  });
}
