import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'ConfirmationCameraState.dart';

/// Cubit خاص بإدارة عملية تسجيل الحضور
/// يتعامل مع:
/// - بيانات الموقع والوقت
/// - ملاحظات الموظف
/// - إرسال البيانات للخادم
class ConfirmationCameraCubit extends Cubit<ConfirmationCameraState> {
  ConfirmationCameraCubit({
    required Map<String, double> location,
  }) : super(ConfirmationCameraState(
    location: location,
    dateTime: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
  ));

  /// تحديث ملاحظات الحضور
  void updateNotes(String notes) {
    emit(state.copyWith(notes: notes));
  }

  /// تسجيل الحضور
  /// يرسل البيانات التالية للخادم:
  /// - صورة الموظف
  /// - الموقع الجغرافي
  /// - الوقت والتاريخ
  /// - الملاحظات (اختياري)
  Future<void> submitClockIn({
    required XFile image,
    String? userId,
  }) async {
    try {
      // إرسال حالة التحميل
      emit(state.copyWith(status: ClockInStatus.submitting));

      // هنا يتم إرسال البيانات للخادم
      // TODO: استبدل هذا بالكود الحقيقي للـ API
      /*
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('YOUR_API_ENDPOINT/clock-in'),
      );

      request.files.add(
        await http.MultipartFile.fromPath('selfie', image.path),
      );

      request.fields['latitude'] = state.location['lat'].toString();
      request.fields['longitude'] = state.location['long'].toString();
      request.fields['dateTime'] = state.dateTime;
      request.fields['notes'] = state.notes ?? '';
      request.fields['userId'] = userId ?? '';

      final response = await request.send();

      if (response.statusCode == 200) {
        // نجح التسجيل
      } else {
        // فشل التسجيل
      }
      */

      // محاكاة استدعاء API
      await Future.delayed(const Duration(seconds: 2));

      // إرسال حالة النجاح
      emit(state.copyWith(
        status: ClockInStatus.success,
        successMessage: "تم تسجيل الحضور بنجاح!",
      ));
    } catch (e) {
      // إرسال حالة الخطأ
      emit(state.copyWith(
        status: ClockInStatus.error,
        errorMessage: "فشل تسجيل الحضور: $e",
      ));
    }
  }

  /// إعادة تعيين الحالة
  void reset() {
    emit(ConfirmationCameraState(
      location: state.location,
      dateTime: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
    ));
  }

  /// مسح رسالة الخطأ
  void clearError() {
    emit(state.copyWith(
      status: ClockInStatus.initial,
      errorMessage: null,
    ));
  }
}