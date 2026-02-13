import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/enitity/attendanceclockIn.dart';
import 'package:hr_management/features/attendance/domain/repository/AttendanceRepository.dart';

import '../../../auth/domain/failures/failure.dart';

class ClockInAttendanceUseCase {
  final AttendanceRepository attendanceRepository;
  const ClockInAttendanceUseCase({
    required this.attendanceRepository,
  });
  Future<Either<Failure, bool>> call({
      required AttendanceClockIn attendanceClockIn,
  }) async {
    return await attendanceRepository.attendanceClockIn(
      attendanceClockIn: attendanceClockIn,
    );
  }
}