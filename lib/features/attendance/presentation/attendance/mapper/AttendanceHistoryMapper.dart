import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/presentation/design_system/model/history_card_model.dart';
import '../../../domain/enitity/AttendanceHistory.dart';
import '../../../domain/enitity/AttendanceHistoryDays.dart';
import '../logic/attendance_screen_state.dart';

class AttendanceHistoryMapper {
  static AttendanceScreenState toAttendanceUiState(
    AttendanceHistory attendanceHistory,
  ) {
    return AttendanceScreenState(
      isLoading: false,
      payPeriodWorkingHours: formatTo12Hour(
        attendanceHistory.summaryHistoryMonth.totalHours.toString(),
      ),
      historyAttendanceCard: _mapDaysToHistoryCards(
        attendanceHistory.attendanceHistoryDays,
      ),
      todayWorkingHours: formatTo12Hour(
        attendanceHistory.summaryHistoryMonth.totalHours.toString(),
      ),
    );
  }

  static List<HistoryCardModel> _mapDaysToHistoryCards(
    List<AttendanceDay> days,
  ) {
    return days.map((day) {
      return HistoryCardModel(
        date: DateTime.parse(day.date??''),
        infoItems: [
          InfoItem(
            label: 'Total Hours',
            value: formatTo12Hour(day.hoursWorked.toString()),
          ),
          InfoItem(label: 'Clock in & Out', value: _buildClockInOut(day)),
        ],
        headerIcon: Icons.check_circle,
      );
    }).toList();
  }

  static String _buildClockInOut(AttendanceDay day) {
    return '${formatTo12Hour(day.checkInTime)} — ${formatTo12Hour(day.checkOutTime)}';
  }
}

String formatTo12Hour(String? dateTimeString) {
  if (dateTimeString == null || dateTimeString.isEmpty) {
    return '00:00';
  }

  try {
    final dateTime = DateTime.parse(dateTimeString).toLocal();
    return DateFormat('hh:mm a').format(dateTime);
  } catch (e) {
    return '00:00';
  }
}
