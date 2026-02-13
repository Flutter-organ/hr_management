import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/enitity/AttendanceHistoryDays.dart';

import '../../../auth/domain/failures/failure.dart';
import '../enitity/UserLocation.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> getCurrentLocation();
  Future<Either<Failure, double>> getDistanceBetweenLocations(Location location1, Location location2);
}
