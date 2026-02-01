import 'package:fpdart/fpdart.dart';

import '../../../auth/domain/failures/failure.dart';
import '../enitity/UserLocation.dart';
import '../repository/LocationRepository.dart';

class GetCurrentLocationUseCase {
  final LocationRepository repository;

  GetCurrentLocationUseCase(this.repository);

  Future<Either<Failure, Location>> call() {
    return repository.getCurrentLocation();
  }
}
