import 'package:equatable/equatable.dart';

/// حالات تسجيل الحضور
enum ClockInStatus  {
  initial,      // الحالة الأولية
  submitting,   // جاري إرسال البيانات
  success,      // تم التسجيل بنجاح
  error,        // حدث خطأ في التسجيل
}

/// حالة تسجيل الحضور
class ConfirmationCameraState extends Equatable {
  /// حالة عملية التسجيل
  final ClockInStatus status;

  /// الموقع الجغرافي (خط الطول والعرض)
  final Map<String, double> location;

  /// التاريخ والوقت الحالي
  final String dateTime;

  /// ملاحظات الموظف (اختياري)
  final String? notes;

  /// رسالة الخطأ
  final String? errorMessage;

  /// رسالة النجاح
  final String? successMessage;

  const ConfirmationCameraState({
    this.status = ClockInStatus.initial,
    required this.location,
    required this.dateTime,
    this.notes,
    this.errorMessage,
    this.successMessage,
  });

  /// نسخ الحالة مع تحديث بعض القيم
  ConfirmationCameraState copyWith({
    ClockInStatus? status,
    Map<String, double>? location,
    String? dateTime,
    String? notes,
    String? errorMessage,
    String? successMessage,
  }) {
    return ConfirmationCameraState(
      status: status ?? this.status,
      location: location ?? this.location,
      dateTime: dateTime ?? this.dateTime,
      notes: notes ?? this.notes,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  /// التحقق من أن العملية جارية
  bool get isSubmitting => status == ClockInStatus.submitting;

  /// التحقق من النجاح
  bool get isSuccess => status == ClockInStatus.success;

  /// التحقق من وجود خطأ
  bool get hasError => status == ClockInStatus.error;

  @override
  List<Object?> get props => [
    status,
    location,
    dateTime,
    notes,
    errorMessage,
    successMessage,
  ];
}