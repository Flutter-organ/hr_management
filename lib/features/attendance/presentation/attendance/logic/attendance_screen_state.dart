import '../../../../../../core/presentation/design_system/model/history_card_model.dart';

enum AttendanceStatus {
  notClockedIn,
  clockedIn,
  onBreak,
  clockedOut,
}

class AttendanceScreenState {
  final bool isLoading;
  final String? apiError;
  final String todayWorkingHours;
  final String payPeriodWorkingHours;
  final AttendanceStatus attendanceStatus;
  final String? checkInTime;
  final bool hasActiveBreak;
  final double totalBreakHours;
  final List<HistoryCardModel> historyAttendanceCard;

  const AttendanceScreenState({
    this.isLoading = false,
    this.apiError,
    this.todayWorkingHours = '00:00:00',
    this.payPeriodWorkingHours = '00:00',
    this.attendanceStatus = AttendanceStatus.notClockedIn,
    this.checkInTime,
    this.hasActiveBreak = false,
    this.totalBreakHours = 0.0,
    this.historyAttendanceCard = const [],
  });

  bool get isClockedIn => attendanceStatus == AttendanceStatus.clockedIn;
  bool get isOnBreak => attendanceStatus == AttendanceStatus.onBreak;
  bool get isClockedOut => attendanceStatus == AttendanceStatus.clockedOut;
  bool get isNotClockedIn => attendanceStatus == AttendanceStatus.notClockedIn;

  AttendanceScreenState copyWith({
    bool? isLoading,
    String? apiError,
    String? todayWorkingHours,
    String? payPeriodWorkingHours,
    AttendanceStatus? attendanceStatus,
    String? checkInTime,
    bool? hasActiveBreak,
    double? totalBreakHours,
    List<HistoryCardModel>? historyAttendanceCard,
  }) {
    return AttendanceScreenState(
      isLoading: isLoading ?? this.isLoading,
      apiError: apiError ?? this.apiError,
      todayWorkingHours: todayWorkingHours ?? this.todayWorkingHours,
      payPeriodWorkingHours: payPeriodWorkingHours ?? this.payPeriodWorkingHours,
      attendanceStatus: attendanceStatus ?? this.attendanceStatus,
      checkInTime: checkInTime ?? this.checkInTime,
      hasActiveBreak: hasActiveBreak ?? this.hasActiveBreak,
      totalBreakHours: totalBreakHours ?? this.totalBreakHours,
      historyAttendanceCard: historyAttendanceCard ?? this.historyAttendanceCard,
    );
  }
}