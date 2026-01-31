import 'package:equatable/equatable.dart';

import 'AttendanceHistoryDays.dart';
import 'SummaryHistoryMonth.dart';

class AttendanceHistory extends Equatable {
  final int month;
  final int year;
  final SummaryHistoryMonth summaryHistoryMonth;
  final List<AttendanceHistoryDays> attendanceHistoryDays;

  const AttendanceHistory({
    required this.month,
    required this.year,
    required this.summaryHistoryMonth,
    required this.attendanceHistoryDays,
  });

  @override
  List<Object?> get props => [
    month,
    year,
    summaryHistoryMonth,
    attendanceHistoryDays,
  ];
}
