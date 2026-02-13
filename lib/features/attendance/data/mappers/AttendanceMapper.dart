import 'package:hr_management/features/attendance/data/data_source/remote/dto/Attendance_history_response.dart';
import 'package:hr_management/features/attendance/data/data_source/remote/dto/request.dart';
import 'package:hr_management/features/attendance/domain/enitity/AttendanceHistoryDays.dart';
import 'package:hr_management/features/attendance/domain/enitity/SummaryHistoryMonth.dart';

import '../../domain/enitity/AttendanceHistory.dart';
import '../../domain/enitity/attendanceclockIn.dart';
import '../data_source/remote/dto/SummaryHistoryMonthDto.dart';
import '../data_source/remote/dto/attendance_day.dart';

class AttendanceMapper {
  static AttendanceHistory toDomainAttendanceHistory(
    AttendanceHistoryResponse attendanceHistoryResponse,
  ) {
    return AttendanceHistory(
      attendanceHistoryDays: attendanceHistoryResponse.attendanceDayDto
          .map(toDomainAttendanceDay)
          .toList(),
      summaryHistoryMonth: toDomainSummaryHistoryMonth(
        attendanceHistoryResponse.summaryHistoryMonthDto,
      ),
      month: attendanceHistoryResponse.month,
      year: attendanceHistoryResponse.year,
    );
  }

  static AttendanceDay toDomainAttendanceDay(AttendanceDayDto? attendanceDay) {
    return AttendanceDay(
      id: attendanceDay?.id ?? 0,
      date: attendanceDay?.date.toString() ??'',
      checkInTime: attendanceDay?.checkInTime ?? '',
      checkOutTime: attendanceDay?.checkOutTime ?? '',
      hoursWorked: attendanceDay?.hoursWorked ?? 0,
      overtimeHours: attendanceDay?.overtimeHours ?? 0,
      status: attendanceDay?.status ?? '',
      hasActiveBreak: attendanceDay?.hasActiveBreak ?? false,
      checkInLocation: attendanceDay?.checkInLocation ?? '',
      proofImage: attendanceDay?.proofImage ?? '',
      notes: attendanceDay?.notes ?? '',
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

  static AttendanceClockInRequest toDtoAttendanceClockInRequest(
    AttendanceClockIn attendanceClockIn,
  ) {
    return AttendanceClockInRequest(
      latitude: attendanceClockIn.latitude,
      longitude: attendanceClockIn.longitude,
      notes: attendanceClockIn.notes ?? '',
      proofImage: attendanceClockIn.proofImage,
    );
  }
}
