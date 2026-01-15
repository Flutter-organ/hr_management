import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/data/data_source/local/onboarding_local_data_source%20.dart';
import 'package:hr_management/features/auth/data/mappers/auth_failure_mapper.dart';
import 'package:hr_management/features/auth/domain/failures/failure.dart';
import 'package:hr_management/features/auth/domain/repository/on_boarding_repository.dart';

class OnboardingRepositoryImp implements OnboardingRepository {
  final OnboardingLocalDataSource _localDataSource;
  OnboardingRepositoryImp({required OnboardingLocalDataSource localDataSource})
    : _localDataSource = localDataSource;
  @override
  Future<Either<Failure, bool>> isOnboardingCompleted() async {
    try {
      return Right(await _localDataSource.isOnboardingCompleted());
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveOnboardingCompleted() async {
    try {
      await _localDataSource.saveOnboardingCompleted();
      return Right(unit);
    } catch (e) {
      return Left(AuthFailureMapper.mapException(e));
    }
  }
}
