import 'package:flutter/material.dart';

import '../../../../../core/presentation/design_system/model/history_card_model.dart';
import '../../../domain/enitity/history_attendance.dart';
import '../../../domain/enitity/today_attendance.dart';
import '../logic/attendance_screen_state.dart';

/// ========================================================
/// Mapper: بيحول الـ Domain Entities لـ UI State
/// ========================================================
class AttendanceHistoryMapper {

  // ----------------------------------------------------------
  // Today Attendance → State
  // ----------------------------------------------------------

  static AttendanceScreenState toTodayAttendanceUiState(
      TodayAttendance today,
      ) {
    final status = _resolveStatus(today.status, today.hasActiveBreak, today.checkOutTime);

    return AttendanceScreenState(
      isLoading: false,
      attendanceStatus: status,

      // وقت الدخول → التايمر في الـ Cubit هيحسب منه
      checkInTime: today.checkInTime,

      // الساعات من الـ API كـ fallback لو التايمر مش شغال
      // بنحولها من decimal "1.09" لـ "01:05:24"
      todayWorkingHours: _decimalHoursToHHMMSS(today.hoursWorked),

      hasActiveBreak: today.hasActiveBreak,
      totalBreakHours: today.totalBreakHours.toDouble(),
    );
  }

  // ----------------------------------------------------------
  // History Attendance → State
  // ----------------------------------------------------------

  static AttendanceScreenState toAttendanceUiState(
      HistoryAttendance history,
      ) {
    return AttendanceScreenState(
      isLoading: false,
      // إجمالي الـ Pay Period بالساعات
      payPeriodWorkingHours: _formatDecimalHours(history.summary.totalHours),
      historyAttendanceCard: _mapDaysToHistoryCards(history.days),
    );
  }

  // ----------------------------------------------------------
  // Private Helpers
  // ----------------------------------------------------------

  /// بيحدد الحالة بناءً على بيانات الـ API
  static AttendanceStatus _resolveStatus(
      String status,
      bool hasActiveBreak,
      String? checkOutTime,
      ) {
    // لو في استراحة شغالة → onBreak (أولوية)
    if (hasActiveBreak) return AttendanceStatus.onBreak;

    // لو خرج → clockedOut
    if (checkOutTime != null && checkOutTime.isNotEmpty) {
      return AttendanceStatus.clockedOut;
    }

    // حسب الـ status من الـ API
    switch (status.toLowerCase()) {
      case 'present':
        return AttendanceStatus.clockedIn;
      case 'absent':
      default:
        return AttendanceStatus.notClockedIn;
    }
  }

  /// بيحول "1.09" (decimal hours) لـ "01:05:24" (HH:mm:ss)
  ///
  /// المعادلة:
  /// 1.09 ساعة = 1 ساعة + 0.09 * 60 دقيقة = 1 ساعة + 5.4 دقيقة
  ///           = 1 ساعة + 5 دقيقة + 0.4 * 60 ثانية = 01:05:24
  static String _decimalHoursToHHMMSS(String decimalStr) {
    final decimal = double.tryParse(decimalStr) ?? 0.0;
    final totalSeconds = (decimal * 3600).round();
    return _secondsToHHMMSS(totalSeconds);
  }

  /// بيحول عدد الثواني لـ "HH:mm:ss"
  static String _secondsToHHMMSS(int totalSeconds) {
    if (totalSeconds < 0) totalSeconds = 0;
    final h = totalSeconds ~/ 3600;
    final m = (totalSeconds % 3600) ~/ 60;
    final s = totalSeconds % 60;
    return '${h.toString().padLeft(2, '0')}:'
        '${m.toString().padLeft(2, '0')}:'
        '${s.toString().padLeft(2, '0')}';
  }

  /// بيحول decimal hours لـ "HH:mm" (للـ Pay Period)
  static String _formatDecimalHours(num decimalHours) {
    final total = (decimalHours * 60).round();
    final h = total ~/ 60;
    final m = total % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }

  /// بيحول قائمة الأيام لـ HistoryCardModel
  static List<HistoryCardModel> _mapDaysToHistoryCards(List<Day> days) {
    return days.map((day) {
      return HistoryCardModel(
        date: DateTime.parse(day.date),
        infoItems: [
          InfoItem(
            label: 'Total Hours',
            value: _decimalHoursToHHMMSS(day.hoursWorked),
          ),
          InfoItem(
            label: 'Clock in & Out',
            value: _buildClockInOutLabel(day),
          ),
        ],
        headerIcon: Icons.check_circle,
      );
    }).toList();
  }

  static String _buildClockInOutLabel(Day day) {
    final inTime = _formatTo12Hour(day.checkInTime);
    final outTime = _formatTo12Hour(day.checkOutTime);
    return '$inTime — $outTime';
  }

  /// بيحول "HH:mm:ss" لـ "12:00 PM"
  static String _formatTo12Hour(String? time) {
    if (time == null || time.isEmpty) return '--:--';
    final parts = time.split(':');
    if (parts.length < 2) return '--:--';
    final hours = int.tryParse(parts[0]) ?? 0;
    final minutes = int.tryParse(parts[1]) ?? 0;
    final period = hours >= 12 ? 'PM' : 'AM';
    final h12 = hours % 12 == 0 ? 12 : hours % 12;
    return '${h12.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} $period';
  }
}