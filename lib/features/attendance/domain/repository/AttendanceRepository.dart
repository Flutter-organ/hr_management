import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/enitity/attendanceclockIn.dart';
import '../../../auth/domain/failures/failure.dart';
import '../enitity/history_attendance.dart';
import '../enitity/today_attendance.dart';

abstract class AttendanceRepository {
  Future<Either<Failure,HistoryAttendance>> attendanceHistory();

  Future<Either<Failure, TodayAttendance>> getTodayAttendance();

  Future<Either<Failure, bool>> clockInAttendance({
    required ClockInAttendance clockInAttendance,
  });

  Future<Either<Failure, bool>> attendanceClockOut();

  Future<Either<Failure, bool>> startAttendanceBreak();
  Future<Either<Failure, bool>> endAttendanceBreak();

}
