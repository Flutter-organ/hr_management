import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/repository/AttendanceRepository.dart';

import '../../../auth/domain/failures/failure.dart';

class ClockOutAttendanceUseCase {
  final AttendanceRepository attendanceRepository;

  ClockOutAttendanceUseCase({required this.attendanceRepository});
  Future<Either<Failure, bool>> call() async {
    final isClockedOut = await attendanceRepository.attendanceClockOut();
    return isClockedOut;
  }
}