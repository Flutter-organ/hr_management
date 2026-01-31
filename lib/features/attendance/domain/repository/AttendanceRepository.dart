import 'package:fpdart/fpdart.dart';

import '../../../auth/domain/failures/failure.dart';
import '../enitity/AttendanceHistory.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, AttendanceHistory>> attendanceHistory();
}