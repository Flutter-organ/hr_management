import 'package:fpdart/fpdart.dart';

import '../../../auth/domain/failures/failure.dart';
import '../enitity/history_attendance.dart';
import '../repository/AttendanceRepository.dart';

class GetAttendanceHistoryUseCase {
  final AttendanceRepository _attendanceRepository;

  const GetAttendanceHistoryUseCase(this._attendanceRepository);

  Future<Either<Failure, HistoryAttendance>> call() async {
    return _attendanceRepository.attendanceHistory();
  }
}
