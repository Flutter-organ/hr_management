import 'SummaryHistoryMonthDto.dart';
import 'attendance_day.dart';

class AttendanceHistoryResponse {
  final int month;
  final int year;
  final SummaryHistoryMonthDto summaryHistoryMonthDto;
  final List<AttendanceDayDto> attendanceDayDto;

  AttendanceHistoryResponse({
    required this.month,
    required this.year,
    required this.summaryHistoryMonthDto,
    required this.attendanceDayDto,
  });

  factory AttendanceHistoryResponse.fromJson(Map<String, dynamic> json) {
    return AttendanceHistoryResponse(
      month: json['month'],
      year: json['year'],
      summaryHistoryMonthDto: SummaryHistoryMonthDto.fromJson(json['summary']),
      attendanceDayDto: (json['records'] as List)
          .map((e) => AttendanceDayDto.fromJson(e))
          .toList(),
    );
  }
}
