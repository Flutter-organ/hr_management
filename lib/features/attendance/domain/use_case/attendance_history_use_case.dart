import 'package:fpdart/fpdart.dart';

import '../../../auth/domain/failures/failure.dart';
import '../enitity/AttendanceHistory.dart';
import '../repository/AttendanceRepository.dart';

class GetAttendanceHistoryUseCase {
  final AttendanceRepository _attendanceRepository;

  const GetAttendanceHistoryUseCase(this._attendanceRepository);

  Future<Either<Failure, AttendanceHistory>> call() async {
    return _attendanceRepository.attendanceHistory();
  }
}
