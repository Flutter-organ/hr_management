import 'dart:async';

import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/use_case/EndAttendanceBreakUseCase.dart';
import '../../../domain/use_case/StartAttendanceBreakUseCase.dart';
import '../../../domain/use_case/attendance_history_use_case.dart';
import '../../../domain/use_case/clock_out_attendance_use_case.dart';
import '../../../domain/use_case/get_attendance_today_use_case.dart';
import '../mapper/AttendanceHistoryMapper.dart';
import 'attendance_screen_state.dart';

class AttendanceScreenCubit extends BaseCubit<AttendanceScreenState> {
  final GetAttendanceHistoryUseCase _attendanceHistoryUseCase;
  final GetTodayAttendanceUseCase _getTodayAttendanceUseCase;
  final StartAttendanceBreakUseCase _startAttendanceBreakUseCase;
  final EndAttendanceBreakUseCase _endAttendanceBreakUseCase;
  final ClockOutAttendanceUseCase _clockOutAttendanceUseCase;


  // ---- التايمر ----
  Timer? _liveTimer;

  /// وقت الدخول كـ DateTime عشان نحسب الفرق منه
  DateTime? _clockInDateTime;

  /// وقت الاستراحات المجمعة بالثواني (بنطرحها من الوقت الكلي)
  int _totalBreakSeconds = 0;

  AttendanceScreenCubit({
    required GetTodayAttendanceUseCase getTodayAttendanceUseCase,
    required GetAttendanceHistoryUseCase getAttendanceHistoryUseCase,
    required StartAttendanceBreakUseCase startAttendanceBreakUseCase,
    required EndAttendanceBreakUseCase endAttendanceBreakUseCase,
    required ClockOutAttendanceUseCase clockOutAttendanceUseCase,
  }) : _attendanceHistoryUseCase = getAttendanceHistoryUseCase,
  _getTodayAttendanceUseCase = getTodayAttendanceUseCase,
  _startAttendanceBreakUseCase = startAttendanceBreakUseCase,
  _endAttendanceBreakUseCase = endAttendanceBreakUseCase,
  _clockOutAttendanceUseCase = clockOutAttendanceUseCase,
        super(const AttendanceScreenState()) {
    loadTodayAttendance();
    loadAttendanceHistory();
  }

  Future<void> loadTodayAttendance() async {
    await execute(
        onLoading: () => updateState((s) => s.copyWith(isLoading: true)),
        call: () => _getTodayAttendanceUseCase(),
        onSuccess: (todayAttendance) {
          // نحول الـ Entity لـ UI State
          final mappedState =
          AttendanceHistoryMapper.toTodayAttendanceUiState(todayAttendance);

          // نحدث الـ State
          updateState((s) => s.copyWith(
            isLoading: false,
            attendanceStatus: mappedState.attendanceStatus,
            checkInTime: mappedState.checkInTime,
            todayWorkingHours: mappedState.todayWorkingHours,
            hasActiveBreak: mappedState.hasActiveBreak,
            totalBreakHours: mappedState.totalBreakHours,
          ));

          // ---- قرار التايمر ----
          // نشغل التايمر بس لو الموظف داخل وشغال (مش في استراحة ومش خرج)
          if (mappedState.attendanceStatus == AttendanceStatus.clockedIn) {
            _startLiveTimer(
              checkInTimeStr: todayAttendance.checkInTime,
              totalBreakHours: todayAttendance.totalBreakHours.toDouble(),
            );
          } else {
            // في أي حالة تانية → وقف التايمر
            _stopLiveTimer();
          }
        },
        onError: (e) {
          updateState((s) =>
              s.copyWith(
                isLoading: false,
                apiError: e.message,
              ));
        },
      );
    }
  Future<void> loadAttendanceHistory() async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(isLoading: true)),
      call: () => _attendanceHistoryUseCase(),
      onSuccess: (history) {
        updateState((s) =>
            s.copyWith(
              isLoading: false,
              historyAttendanceCard: AttendanceHistoryMapper
                  .toAttendanceUiState(history)
                  .historyAttendanceCard,
              todayWorkingHours: AttendanceHistoryMapper
                  .toAttendanceUiState(history)
                  .todayWorkingHours,
              payPeriodWorkingHours: AttendanceHistoryMapper
                  .toAttendanceUiState(history)
                  .payPeriodWorkingHours,
            ));
      },
      onError: (e) {
        updateState((s) =>
            s.copyWith(
              isLoading: false,
              apiError: e.message,
            ));
      },
    );
  }

  Future<void> startAttendanceBreak() async {
    execute(
        onLoading: () => updateState((s) => s.copyWith(isLoading: true)),
        call: () => _startAttendanceBreakUseCase(),
        onSuccess: (isBreakStarted) {
          updateState((s) =>
              s.copyWith(
                isLoading: false,
                attendanceStatus: AttendanceStatus.onBreak
              ));
        },
        onError: (e) {
          updateState((s) =>
              s.copyWith(
                isLoading: false,
                apiError: e.message,
              )
          );
        }
    );
  }
  Future<void> endAttendanceBreak() async {
    execute(
        onLoading: () => updateState((s) => s.copyWith(isLoading: true)),
        call: () => _endAttendanceBreakUseCase(),
        onSuccess: (isBreakEnded) {
          updateState((s) =>
              s.copyWith(
                isLoading: false,
              ));
        },
        onError: (e) {
          updateState((s) =>
              s.copyWith(
                  isLoading: false,
                  apiError: e.message
              )
          );
        }
    );
  }
  Future<void> clockOutAttendance() async {
    execute(
        onLoading: () => updateState((s) => s.copyWith(isLoading: true)),
        call: () => _clockOutAttendanceUseCase(),
        onSuccess: (isClockedOut) {
          updateState((s) =>
              s.copyWith(
                  isLoading: false,
                  attendanceStatus: AttendanceStatus.clockedOut
              ));
          _stopLiveTimer();
        },
        onError: (e) {
          updateState((s) =>
              s.copyWith(
                  isLoading: false,
                  apiError: e.message
              )
          );
        }
    );
  }

  // ============================================================
  // Live Timer
  // ============================================================

  /// بيبدأ التايمر من وقت الدخول
  ///
  /// [checkInTimeStr] → "HH:mm:ss" من الـ API
  /// [totalBreakHours] → إجمالي الاستراحات بالـ decimal نطرحها من الوقت
  void _startLiveTimer({
    required String checkInTimeStr,
    required double totalBreakHours,
  }) {
    _stopLiveTimer(); // وقف أي تايمر قديم

    // احسب وقت الاستراحات بالثواني عشان نطرحها
    _totalBreakSeconds = (totalBreakHours * 3600).round();

    // حول "HH:mm:ss" لـ DateTime بتاريخ النهارده
    _clockInDateTime = _parseTimeStringToToday(checkInTimeStr);

    // ابدأ التيك كل ثانية
    _liveTimer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());

    // عرض فوري قبل أول ثانية
    _tick();
  }
  void _stopLiveTimer() {
    _liveTimer?.cancel();
    _liveTimer = null;
    _clockInDateTime = null;
    _totalBreakSeconds = 0;
  }

  /// بيتشغل كل ثانية - بيحسب الوقت المنقضي ويحدث الـ State
  void _tick() {
    if (_clockInDateTime == null) return;

    // الوقت من الدخول للحظة دي
    final elapsed = DateTime.now().difference(_clockInDateTime!);
    if (elapsed.isNegative) return; // حالة غريبة - تجاهل

    // نطرح وقت الاستراحات
    final workSeconds = elapsed.inSeconds - _totalBreakSeconds;
    if (workSeconds < 0) return;

    // نحول للـ HH:mm:ss
    final formatted = _secondsToHHMMSS(workSeconds);
    updateState((s) => s.copyWith(todayWorkingHours: formatted));
  }

  /// بيحول "HH:mm:ss" لـ DateTime بتاريخ النهارده
  DateTime _parseTimeStringToToday(String timeStr) {
    final parts = timeStr.split(':');
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      int.tryParse(parts.elementAtOrNull(0) ?? '0') ?? 0,
      int.tryParse(parts.elementAtOrNull(1) ?? '0') ?? 0,
      int.tryParse(parts.elementAtOrNull(2) ?? '0') ?? 0,
    );
  }

  /// بيحول الثواني لـ "HH:mm:ss"
  String _secondsToHHMMSS(int totalSeconds) {
    final h = totalSeconds ~/ 3600;
    final m = (totalSeconds % 3600) ~/ 60;
    final s = totalSeconds % 60;
    return '${h.toString().padLeft(2, '0')}:'
        '${m.toString().padLeft(2, '0')}:'
        '${s.toString().padLeft(2, '0')}';
  }



  // ============================================================
  // Public Refresh Methods (بتتبعت من الشاشات التانية)
  // ============================================================

  /// بعد Clock In ناجح
  void refreshAfterClockIn() {
    updateState(
            (s)=> s.copyWith(
          attendanceStatus: AttendanceStatus.clockedIn,
        ));
    loadTodayAttendance();
    loadAttendanceHistory();
  }

  /// بعد Clock Out ناجح
  void refreshAfterClockOut() {
    _stopLiveTimer();
    loadTodayAttendance();
    loadAttendanceHistory();
  }

  /// بعد Break ناجح
  void refreshAfterBreak() {
    // وقف التايمر مؤقتاً وأعد تحميل البيانات
    _stopLiveTimer();
    loadTodayAttendance();
  }
  void refreshAfterBackToWork() {
    _startLiveTimer(
      checkInTimeStr: state.checkInTime!,
      totalBreakHours: state.totalBreakHours,
    );
    loadTodayAttendance();
    loadAttendanceHistory();
  }




  // ============================================================
  // Dispose
  // ============================================================

  @override
  Future<void> close() {
    _stopLiveTimer();
    return super.close();
  }
}