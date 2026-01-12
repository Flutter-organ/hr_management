import 'package:fpdart/fpdart.dart';

import '../../domain/failures/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/local/auth_local_data_source.dart';
import '../mappers/auth_failure_mapper.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImp({required AuthLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

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
