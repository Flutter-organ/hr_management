
import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/enitity/attendanceclockIn.dart';

import '../../../auth/domain/failures/failure.dart';
import '../enitity/AttendanceHistory.dart';
import '../enitity/AttendanceHistoryDays.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, AttendanceHistory>> attendanceHistory();

  Future<Either<Failure, AttendanceDay>> getAttendanceToday();

  Future<Either<Failure, bool>> attendanceClockIn({
    required AttendanceClockIn attendanceClockIn,
  });

  Future<Either<Failure, bool>> attendanceClockOut();

  Future<Either<Failure, bool>> startAttendanceBreak();
  Future<Either<Failure, bool>> endAttendanceBreak();

}
