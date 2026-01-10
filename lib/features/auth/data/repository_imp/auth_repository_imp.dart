import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/CurrentUser.dart';
import 'package:hr_management/features/auth/data/mappers/AuthMapper.dart';
import 'package:hr_management/features/auth/domain/enitites/User.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usecase/RegisterUseCase.dart';
import '../data_source/local/auth_local_data_source.dart';
import '../data_source/remote/AuthRemoteDataSource.dart';
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
    required RegisterParams registerParams,
  }) async {
    try {
      final isRegistered = await _remoteDataSource.register(
        registerParams: registerParams,
      );
      return Right(isRegistered);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, User>> otp({
    required String email,
    required String code,
    required String type,
  }) async {
    try {
      final res = await _remoteDataSource.otp(
        email: email,
        code: code,
        type: type,
      );
      final currentuser = CurrentUser.fromJson(res);
      if (res.success && res.data != null) {
        final user = AuthMapper.toDomain(currentuser.user!);
        return Right(user);
      } else {
        return Left(AuthFailureMapper.mapException(res.message));
      }
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }
}
