
import 'package:hr_management/features/attendance/data/data_source/remote/dto/clock_in_attendance_request.dart';

import 'dto/history_attendance_response.dart';
import 'dto/today_attendance_response.dart';


abstract class AttendanceRemoteDataSource {
  Future<HistoryAttendanceResponse> attendanceHistory();

  Future<TodayAttendanceResponse> attendanceToday();

  Future<bool> clockInAttendance(
    ClockInAttendanceRequest clockInAttendanceRequest,
  );

  Future<bool> attendanceClockOut();

  Future<bool> startAttendanceBreak();
  Future<bool> endAttendanceBreak();

}