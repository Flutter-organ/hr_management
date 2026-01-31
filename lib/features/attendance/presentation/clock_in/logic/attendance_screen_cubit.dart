import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../core/presentation/design_system/model/history_card_model.dart';
import '../../../../../core/presentation/exception/ui_errors.dart';
import '../../../domain/use_case/AttendanceHistoryUseCase.dart';
import '../mapper/AttendanceHistoryMapper.dart';
import 'attendance_screen_state.dart';

/// ✅ Cubit بتاع شاشة الحضور مع دعم Stream
class AttendanceScreenCubit extends BaseCubit<AttendanceScreenState> {
  final AttendanceHistoryUseCase _attendanceHistoryUseCase;

  // ✅ Stream Controller لاستقبال تحديثات الحضور
  final StreamController<ClockInUpdate> _clockInStreamController =
  StreamController<ClockInUpdate>.broadcast();

  // ✅ Stream للاستماع لتحديثات الحضور
  Stream<ClockInUpdate> get clockInStream => _clockInStreamController.stream;

  AttendanceScreenCubit(this._attendanceHistoryUseCase)
      : super(const AttendanceScreenState()) {
    loadAttendanceHistory();
    _listenToClockInUpdates();
  }

  /// ✅ الاستماع لتحديثات تسجيل الحضور
  void _listenToClockInUpdates() {
    _clockInStreamController.stream.listen((update) {
      // تحديث الحالة بناءً على البيانات الجديدة
      updateState((s) => s.copyWith(
        isClockedIn: true,
        lastClockInTime: update.clockInTime,
        lastClockInLocation: update.location,
        todayWorkingHours: _calculateNewWorkingHours(update),
      ));

      // إعادة تحميل التاريخ لعرض السجل الجديد
      loadAttendanceHistory();
    });
  }

  /// ✅ دالة لإرسال تحديث جديد للحضور (يتم استدعاؤها من ConfirmationScreen)
  void notifyClockInSuccess({
    required DateTime clockInTime,
    required String location,
    required String imagePath,
  }) {
    _clockInStreamController.add(
      ClockInUpdate(
        clockInTime: clockInTime,
        location: location,
        imagePath: imagePath,
      ),
    );
  }

  String _calculateNewWorkingHours(ClockInUpdate update) {
    // حساب ساعات العمل الجديدة (يمكن تعديلها حسب المنطق المطلوب)
    final now = DateTime.now();
    final difference = now.difference(update.clockInTime);
    final hours = difference.inHours;
    final minutes = difference.inMinutes % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  Future<void> loadAttendanceHistory() async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(isLoading: true)),
      call: () => _attendanceHistoryUseCase(),
      onSuccess: (attendanceHistory) {
        updateState(
              (s) => s.copyWith(
            isLoading: false,
            historyAttendanceCard: AttendanceHistoryMapper.toAttendanceUiState(
              attendanceHistory,
            ).historyAttendanceCard,
            todayWorkingHours: AttendanceHistoryMapper.toAttendanceUiState(
              attendanceHistory,
            ).todayWorkingHours,
            payPeriodWorkingHours: AttendanceHistoryMapper.toAttendanceUiState(
              attendanceHistory,
            ).payPeriodWorkingHours,
          ),
        );
      },
      onError: (UiError error) {
        updateState(
              (s) => s.copyWith(isLoading: false, apiError: error.message),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _clockInStreamController.close();
    return super.close();
  }
}

/// ✅ Model للتحديثات الجديدة
class ClockInUpdate {
  final DateTime clockInTime;
  final String location;
  final String imagePath;

  ClockInUpdate({
    required this.clockInTime,
    required this.location,
    required this.imagePath,
  });
}