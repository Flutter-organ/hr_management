import 'attendance_day.dart';

class AttendanceTodayResponse {
  final AttendanceDayDto attendanceDayDto;

  AttendanceTodayResponse({required this.attendanceDayDto});

  factory AttendanceTodayResponse.fromJson(Map<String, dynamic> json) {
    return AttendanceTodayResponse(
      attendanceDayDto: AttendanceDayDto.fromJson(json['data']['attendance']),
    );
  }
}
