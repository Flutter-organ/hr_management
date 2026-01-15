import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/data/data_source/remote/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/CurrentUser.dart';
import 'package:hr_management/features/auth/domain/enitites/User.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/local/auth_local_data_source.dart';
import '../mappers/auth_failure_mapper.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImp({
    required AuthLocalDataSource localDataSource,
    required AuthRemoteDataSource remoteDatasource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDatasource;

  Future<Either<Failure, User>> login({
    required String identifier,
    required String password,
    required String loginType,
  }) async {
    try {
      final response = await _remoteDataSource.login(
        identifier: identifier,
        password: password,
        loginType: loginType,
      );
      if (response.success && response.data != null) {
        final currentUser = CurrentUser.fromJson(response.data);
        await _localDataSource.saveToken(currentUser.accessToken!);
        final user = currentUser.user!.toDomain();
        return Right(user);
      } else {
        return Left(AuthFailureMapper.mapException(response.message));
      }
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

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
}
