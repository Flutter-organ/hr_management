import 'package:camera/camera.dart';
import 'package:hr_management/core/presentation/base_viewmodel/base_cubit.dart';
import 'package:intl/intl.dart';

import 'ConfirmationCameraState.dart';


class ConfirmationCameraCubit extends BaseCubit<ConfirmationCameraState> {
  ConfirmationCameraCubit({
    required Map<String, double> location,
  }) : super(ConfirmationCameraState(
    location: location,
    dateTime: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
  ));

  void updateNotes(String notes) {
    updateState(
        (s)=>s.copyWith(notes: notes),
    );
  }

  Future<void> submitClockIn({
    required XFile image,
    String? userId,
  }) async {
    // execute(call: call, onSuccess: onSuccess, onError: onError);
  }

  void reset() {
    updateState((s) => s.copyWith(
      location: state.location,
      dateTime: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
    ));
  }

  void clearError() {
    updateState((s) => s.copyWith(
        status: ClockInStatus.initial,
        errorMessage: null
    ));
  }
}