import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/enitity/UserLocation.dart';

import '../../../auth/domain/failures/failure.dart';
import '../repository/LocationRepository.dart';

class Getdistancebetweenlocationusecase {
  LocationRepository locationRepository;

  Getdistancebetweenlocationusecase(this.locationRepository);
  Future<Either<Failure, double>> call(Location userLocation, Location officeLocation) async {
    return  locationRepository.getDistanceBetweenLocations(
      userLocation,
      officeLocation
    );
  }
}
