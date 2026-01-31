import 'package:hr_management/features/attendance/data/data_source/remote/dto/Attendance_history_response.dart';
import 'package:hr_management/features/attendance/domain/enitity/AttendanceHistoryDays.dart';
import 'package:hr_management/features/attendance/domain/enitity/SummaryHistoryMonth.dart';

import '../../domain/enitity/AttendanceHistory.dart';
import '../data_source/remote/dto/SummaryHistoryMonthDto.dart';
import '../data_source/remote/dto/attendance_history_daysDto.dart';

class AttendanceMapper {
  static AttendanceHistory toDomainAttendanceHistory(
    AttendanceHistoryResponse attendanceHistoryResponse,
  ) {
    return AttendanceHistory(
      attendanceHistoryDays: attendanceHistoryResponse.attendanceHistoryDaysDto!
          .map(toDomainAttendanceHistoryDays)
          .toList(),
      summaryHistoryMonth: toDomainSummaryHistoryMonth(attendanceHistoryResponse.summaryHistoryMonthDto),
      month: attendanceHistoryResponse.month ?? 0,
      year: attendanceHistoryResponse.year ?? 0,
    );
  }

  static AttendanceHistoryDays toDomainAttendanceHistoryDays(
    AttendanceHistoryDaysDto? attendanceHistoryDaysDto,
  ) {
    return AttendanceHistoryDays(
      id: attendanceHistoryDaysDto?.id ?? 0,
      date: attendanceHistoryDaysDto?.date ?? '',
      checkInTime: attendanceHistoryDaysDto?.checkInTime ?? '',
      checkInLocation: attendanceHistoryDaysDto?.checkInLocation ?? '',
      checkOutTime: attendanceHistoryDaysDto?.checkOutTime ?? '',
      checkOutLocation: attendanceHistoryDaysDto?.checkOutLocation ?? '',
      hoursWorked: attendanceHistoryDaysDto?.hoursWorked ?? '',
      overtimeHours: attendanceHistoryDaysDto?.overtimeHours ?? '',
      status: attendanceHistoryDaysDto?.status ?? '',
      notes: attendanceHistoryDaysDto?.notes ?? '',
      createdAt: attendanceHistoryDaysDto?.createdAt ?? '',
      updatedAt: attendanceHistoryDaysDto?.updatedAt ?? '',
    );
  }

  static SummaryHistoryMonth toDomainSummaryHistoryMonth(
    SummaryHistoryMonthDto? summaryHistoryMonthDto,
  ) {
    return SummaryHistoryMonth(
      totalDays: summaryHistoryMonthDto?.totalDays ?? 0,
      totalHours: summaryHistoryMonthDto?.totalHours ?? 0,
      presentDays: summaryHistoryMonthDto?.presentDays ?? 0,
      lateDays: summaryHistoryMonthDto?.lateDays ?? 0,
      absentDays: summaryHistoryMonthDto?.absentDays ?? 0,
      overtimeHours: summaryHistoryMonthDto?.overtimeHours ?? 0,
    );
  }
}
