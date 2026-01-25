import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/auth/domain/failures/failure.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, Unit>> saveOnboardingCompleted();
  Future<Either<Failure, bool>> isOnboardingCompleted();
}
