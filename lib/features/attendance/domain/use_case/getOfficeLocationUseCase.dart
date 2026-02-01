import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/enitity/UserLocation.dart';

import '../../../auth/domain/failures/failure.dart';

class GetOfficeLocationUseCase {
  GetOfficeLocationUseCase();

  Future<Either<Failure, Location>> call() async {
    try {
      // Dummy data
      final location = Location(
        latitude: 30.0444,
        longitude: 31.2357,
      );

      return Right(location);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
