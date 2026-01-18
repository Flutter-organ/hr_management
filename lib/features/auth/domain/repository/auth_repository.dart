import 'package:fpdart/fpdart.dart';
import '../enitites/User.dart';
import '../enitites/login_type.dart';
import 'package:hr_management/features/auth/domain/enitites/verify_otp.dart';
import '../../data/data_source/remote/dto/AuthDto.dart';
import '../enitites/Register.dart';
import '../enitites/User.dart';
import '../failures/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, Unit>> saveToken(String token);
  Future<Either<Failure, Unit>> clearToken();
  Future<Either<Failure, bool>> hasToken();
  Future<Either<Failure, bool>> register({
   required Register register ,
  });
  Future<Either<Failure, User>> verifyOTP({
   required VerifyOTP verifyOtp
  });

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

  Future<Either<Failure, User>> login({
    required String identifier,
    required String password,
    required LoginType loginType,
    //required bool isRememberd,
  });

  Future<Either<Failure, Unit>> saveIdentifier(String mail);
  Future<Either<Failure, String?>> getIdentifier();
  Future<Either<Failure, Unit>> clearIdentifier();
}