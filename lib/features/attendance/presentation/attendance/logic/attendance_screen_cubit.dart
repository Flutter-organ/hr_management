import 'dart:async';

import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/use_case/attendance_history_use_case.dart';
import '../../../domain/use_case/get_attendance_today_use_case.dart';
import '../mapper/AttendanceHistoryMapper.dart';
import 'attendance_screen_state.dart';

class AttendanceScreenCubit extends BaseCubit<AttendanceScreenState> {
  final GetAttendanceHistoryUseCase _attendanceHistoryUseCase;
  final GetTodayAttendanceUseCase _getTodayAttendanceUseCase;


  AttendanceScreenCubit({
    required GetTodayAttendanceUseCase getTodayAttendanceUseCase,
    required GetAttendanceHistoryUseCase getAttendanceHistoryUseCase,
  }) : _attendanceHistoryUseCase = getAttendanceHistoryUseCase,
  _getTodayAttendanceUseCase = getTodayAttendanceUseCase,
        super(const AttendanceScreenState()) {
    loadAttendanceHistory();
  }

  // Future<void> loadTodayAttendance() async {
  //   await execute(
  //       onLoading: () => updateState((s) => s.copyWith(isLoading: true)),
  //       call: () => _getTodayAttendanceUseCase(),
  //       onSuccess: (todayAttendance) {
  //         updateState((s) =>
  //             s.copyWith(
  //               isLoading: false,
  //               todayAttendanceCard: AttendanceHistoryMapper
  //                   .toTodayAttendanceUiState(todayAttendance)
  //                   .todayAttendanceCard,
  //               todayWorkingHours: AttendanceHistoryMapper
  //                   .toTodayAttendanceUiState(todayAttendance)
  //                   .todayWorkingHours,
  //               payPeriodWorkingHours: AttendanceHistoryMapper
  //                   .toTodayAttendanceUiState(todayAttendance)
  //                   .payPeriodWorkingHours
  //
  //
  //       },
  //       onError: (e) {
  //         updateState((s) =>
  //             s.copyWith(
  //               isLoading: false,
  //               apiError: e.message,
  //             ));
  //       },
  //     );
  //   }



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

  void refreshAfterClockIn() {
    loadAttendanceHistory();
  }
}