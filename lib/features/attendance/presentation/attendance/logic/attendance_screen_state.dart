import '../../../../../../core/presentation/design_system/model/history_card_model.dart';

class AttendanceScreenState {
  final bool isLoading;
  final String? apiError;

  final String todayWorkingHours;
  final String payPeriodWorkingHours;



  final bool isClockedIn;

  final DateTime? lastClockInTime;
  final String? lastClockInLocation;

  final List<HistoryCardModel> historyAttendanceCard;

  const AttendanceScreenState({
    this.isLoading = false,
    this.apiError,
    this.todayWorkingHours = '00:00',
    this.payPeriodWorkingHours = '00:00',
    this.isClockedIn = false,
    this.lastClockInTime,
    this.lastClockInLocation,
    this.historyAttendanceCard = const [],
  });

  AttendanceScreenState copyWith({
    bool? isLoading,
    String? apiError,
    String? todayWorkingHours,
    String? payPeriodWorkingHours,
    bool? isClockedIn,
    DateTime? lastClockInTime,
    String? lastClockInLocation,
    List<HistoryCardModel>? historyAttendanceCard,
  }) {
    return AttendanceScreenState(
      isLoading: isLoading ?? this.isLoading,
      apiError: apiError ?? this.apiError,
      todayWorkingHours: todayWorkingHours ?? this.todayWorkingHours,
      payPeriodWorkingHours: payPeriodWorkingHours ?? this.payPeriodWorkingHours,
      isClockedIn: isClockedIn ?? this.isClockedIn,
      lastClockInTime: lastClockInTime ?? this.lastClockInTime,
      lastClockInLocation: lastClockInLocation ?? this.lastClockInLocation,
      historyAttendanceCard: historyAttendanceCard ?? this.historyAttendanceCard,
    );
  }
}