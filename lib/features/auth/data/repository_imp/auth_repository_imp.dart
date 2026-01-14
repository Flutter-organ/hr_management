import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/CurrentUser.dart';
import 'package:hr_management/features/auth/domain/enitites/User.dart';
import '../../domain/enitites/Register.dart';
import '../../domain/enitites/User.dart';
import '../../domain/enitites/verify_otp.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usecase/RegisterUseCase.dart';
import '../data_source/local/auth_local_data_source.dart';
import '../data_source/remote/AuthRemoteDataSource.dart';
import '../data_source/remote/dto/UserDto.dart';
import '../mappers/AuthMapper.dart';
import '../mappers/auth_failure_mapper.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImp({
    required AuthLocalDataSource localDataSource,
    required AuthRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = await _localDataSource.getToken();
      return Right(token);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveToken(String token) async {
    try {
      await _localDataSource.saveToken(token);
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearToken() async {
    try {
      await _localDataSource.clearToken();
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> hasToken() async {
    try {
      final hasToken = await _localDataSource.hasToken();
      return Right(hasToken);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> register({
    required Register register,
  }) async {
    try {
      final registerDtoRequest = AuthMapper.toRegisterDtoRequest(register);
      final response = await _remoteDataSource.register(
        registerDtoRequest: registerDtoRequest,
      );
      return Right(response);

    }catch(e){
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, User>> otp({
    required VerifyOTP verifyOtp,
  }) async {
    try {
      final verifyOtpDto = AuthMapper.toVerifyOtpDto(verifyOtp);
      final CurrentUser = await _remoteDataSource.otp(
        verifyOtpDto: verifyOtpDto,
      );
      if (CurrentUser.accessToken != null) {
        await saveToken(CurrentUser.accessToken!);
      }
      final userDto = UserDto.fromJson(CurrentUser.toJson());
      final user = AuthMapper.toUser(userDto);
      return Right(user);
    }catch(e){
      return Left(AuthFailureMapper.mapException(e));
    }
  }
}
