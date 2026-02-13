
import 'package:hr_management/features/attendance/data/data_source/remote/dto/attendance_day.dart';
import 'package:hr_management/features/attendance/data/data_source/remote/dto/request.dart';

import 'dto/Attendance_history_response.dart';

abstract class AttendanceRemoteDataSource {
  Future<AttendanceHistoryResponse> attendanceHistory();

  Future<AttendanceDayDto> attendanceToday();

  Future<bool> attendanceClockIn(
    AttendanceClockInRequest attendanceClockInRequest,
  );

  Future<bool> attendanceClockOut();

  Future<bool> startAttendanceBreak();
  Future<bool> endAttendanceBreak();

}
