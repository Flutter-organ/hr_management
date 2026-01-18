import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/CurrentUser.dart';
import '../../domain/enitites/User.dart';
import '../../domain/enitites/login_type.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/local/auth_local_data_source.dart';
import '../data_source/remote/AuthRemoteDataSource.dart';
import '../data_source/remote/dto/ForgotPasswordRequest.dart';
import '../data_source/remote/dto/ResetPasswordRequest.dart';
import '../mappers/auth_failure_mapper.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;


  const AuthRepositoryImp({
    required AuthLocalDataSource localDataSource,
    required AuthRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  Future<Either<Failure, User>> login({
    required String identifier,
    required String password,
    required String loginType,
    required bool isRememberd,
  }) async {
    try {
      final response = await _remoteDataSource.login(
        identifier: identifier,
        password: password,
        loginType: loginType,
      );
      if (response.success && response.data != null) {
        if (isRememberd) {
          await _localDataSource.saveIdentifier(identifier);
        } else {
          await _localDataSource.clearIdentifier();
        }
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

  @override
  Future<Either<Failure, String>> forgotPassword({
    required String identifier,
    required LoginType loginType,
  }) async {
    try {
      final request = ForgotPasswordRequest(
        identifier: identifier,
        loginType: loginType,
      );

      final response = await _remoteDataSource.forgotPassword(request);
      return Right(response.identifier);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, User>> resetPassword({
    required String identifier,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final request = ResetPasswordRequest(
        identifier: identifier,
        code: code,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      final response = await _remoteDataSource.resetPassword(request);

      await _localDataSource.saveToken(response.accessToken);

      return Right(response.user.toDomain());
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, String?>> getIdentifier() async {
    try {
      final mail = await _localDataSource.getIdentifier();
      return Right(mail);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }



  @override
  Future<Either<Failure, Unit>> saveIdentifier(String mail) async {
    try {
      await _localDataSource.saveIdentifier(mail);
      return Right(unit);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearIdentifier() async {
    try {
      await _localDataSource.clearIdentifier();
      return Right(unit);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }
}