import 'SummaryHistoryMonthDto.dart';
import 'attendance_history_daysDto.dart';

class AttendanceHistoryResponse {
  AttendanceHistoryResponse({
      int? month,
      int? year,
      SummaryHistoryMonthDto? summaryHistoryMonthDto,
      List<AttendanceHistoryDaysDto>? attendanceHistoryDaysDto,}){
    _month = month;
    _year = year;
    _summaryHistoryMonthDto = summaryHistoryMonthDto;
    _attendanceHistoryDaysDto = attendanceHistoryDaysDto;
}

  AttendanceHistoryResponse.fromJson(dynamic json) {
    _month = json['month'];
    _year = json['year'];
    _summaryHistoryMonthDto = json['summary'] != null ? SummaryHistoryMonthDto.fromJson(json['summary']) : null;
    if (json['records'] != null) {
      _attendanceHistoryDaysDto = [];
      json['records'].forEach((v) {
        _attendanceHistoryDaysDto?.add(AttendanceHistoryDaysDto.fromJson(v));
      });
    }
  }
  int? _month;
  int? _year;
  SummaryHistoryMonthDto? _summaryHistoryMonthDto;
  List<AttendanceHistoryDaysDto>? _attendanceHistoryDaysDto;

  int? get month => _month;
  int? get year => _year;
  SummaryHistoryMonthDto? get summaryHistoryMonthDto => _summaryHistoryMonthDto;
  List<AttendanceHistoryDaysDto>? get attendanceHistoryDaysDto => _attendanceHistoryDaysDto;

}