import '../../domain/enitity/attendanceclockIn.dart';
import '../../domain/enitity/history_attendance.dart';
import '../../domain/enitity/today_attendance.dart';
import '../data_source/remote/dto/history_attendance_response.dart';
import '../data_source/remote/dto/clock_in_attendance_request.dart';
import '../data_source/remote/dto/today_attendance_response.dart';

class AttendanceMapper {
  static TodayAttendance toDomainTodayAttendance(
    TodayAttendanceResponse attendanceHistoryResponse,
  ) {
    return TodayAttendance(
      date: attendanceHistoryResponse.date ??'',
      proofImage: attendanceHistoryResponse.proofImage ?? '',
      notes: attendanceHistoryResponse.notes ?? '',
      totalBreakHours: attendanceHistoryResponse.totalBreakHours ??0,
      overtimeHours: attendanceHistoryResponse.overtimeHours ?? '',
      checkInTime: attendanceHistoryResponse.checkInTime ?? '',
      checkOutTime: attendanceHistoryResponse.checkOutTime ?? '',
      createdAt: attendanceHistoryResponse.createdAt ??'',
      checkInLocation: attendanceHistoryResponse.checkInLocation ?? '',
      checkOutLocation: attendanceHistoryResponse.checkOutLocation ?? '',
      updatedAt: attendanceHistoryResponse.updatedAt ?? '',
      hoursWorked: attendanceHistoryResponse.hoursWorked ?? '',
      id: attendanceHistoryResponse.id ?? 0,
      hasActiveBreak: attendanceHistoryResponse.hasActiveBreak ?? false,
      status: attendanceHistoryResponse.status ?? ''
    );

  }
  static HistoryAttendance toDomainAttendanceHistory(
    HistoryAttendanceResponse attendanceHistoryResponse,
  ) {
    return HistoryAttendance(
      month: attendanceHistoryResponse.month ?? 0,
      year: attendanceHistoryResponse.year ?? 0,
      days: (attendanceHistoryResponse.dayResponse ?? <DayResponse>[])
          .map((dayResponse) => toDomainDay(dayResponse))
          .toList(),
      summary: toDomainSummary(
        attendanceHistoryResponse.summary ??
            const SummaryResponse(
              overtimeHours: 0,
              lateDays: 0,
              presentDays: 0,
              totalHours: 0,
              totalDays: 0,
              absentDays: 0,
            ),
      ),
    );
  }

  static Day toDomainDay(DayResponse dayResponse) {
    return Day(
      date: dayResponse.date ?? '',
      proofImage: dayResponse.proofImage ?? '',
      notes: dayResponse.notes ?? '',
      totalBreakHours: dayResponse.totalBreakHours ?? 0,
      overtimeHours: dayResponse.overtimeHours ?? '',
      checkInTime: dayResponse.checkInTime ?? '',
      checkOutTime: dayResponse.checkOutTime ?? '',
      createdAt: dayResponse.createdAt ?? '',
      checkInLocation: dayResponse.checkInLocation ?? '',
      checkOutLocation: dayResponse.checkOutLocation ?? '',
      updatedAt: dayResponse.updatedAt ?? '',
      hoursWorked: dayResponse.hoursWorked ?? '',
      id: dayResponse.id ?? 0,
      hasActiveBreak: dayResponse.hasActiveBreak ?? false,
      status: dayResponse.status ?? '',
    );
  }

  static Summary toDomainSummary(SummaryResponse summaryResponse) {
    return Summary(
      overtimeHours: summaryResponse.overtimeHours ??0,
      lateDays: summaryResponse.lateDays ?? 0,
      presentDays: summaryResponse.presentDays ?? 0,
      totalHours: summaryResponse.totalHours ?? 0,
      totalDays: summaryResponse.totalDays ?? 0,
      absentDays: summaryResponse.absentDays ?? 0,
    );
  }

  static ClockInAttendanceRequest toDtoAttendanceClockInRequest(
    ClockInAttendance attendanceClockIn,
  ) {
    return ClockInAttendanceRequest(
      latitude: attendanceClockIn.latitude,
      longitude: attendanceClockIn.longitude,
      notes: attendanceClockIn.notes ?? '',
      proofImage: attendanceClockIn.proofImage,
    );
  }

}
