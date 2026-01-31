import 'dto/Attendance_history_response.dart';

abstract class  AttendanceRemoteDataSource {
  Future<AttendanceHistoryResponse> attendanceHistory();
}