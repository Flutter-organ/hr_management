

import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

enum LocationStatus {
  initial, // الحالة الأولية
  loading, // جاري تحميل الموقع
  loaded, // تم تحميل الموقع بنجاح
  error, // حدث خطأ
}

/// حالة شاشة تسجيل الحضور مع الموقع
class ClockInLocationState extends Equatable {
  /// حالة تحميل الموقع
  final LocationStatus status;

  /// موقع المستخدم الحالي
  final LatLng? userLocation;

  /// موقع المكتب/منطقة تسجيل الحضور
  final LatLng officeLocation;

  /// المسافة المسموحة لتسجيل الحضور (بالمتر)
  final double allowedRadius;

  /// المسافة الفعلية بين المستخدم والمكتب (بالمتر)
  final double? distanceFromOffice;

  /// هل المستخدم داخل منطقة تسجيل الحضور؟
  final bool isInClockInArea;

  /// حالة ظهور الـ Popup
  final bool isPopupVisible;

  /// رسالة الخطأ
  final String? errorMessage;

  // ──────────────────────────────────────────────────────────────
  // بيانات المستخدم
  // ──────────────────────────────────────────────────────────────

  /// اسم المستخدم
  final String? userName;

  /// رابط صورة المستخدم
  final String? userImageUrl;

  /// تاريخ الانضمام
  final String? dateJoined;

  /// وقت تسجيل الحضور المقرر
  final String? clockInTime;

  /// وقت تسجيل الانصراف المقرر
  final String? clockOutTime;

  const ClockInLocationState({
    this.status = LocationStatus.initial,
    this.userLocation,
    required this.officeLocation,
    this.allowedRadius = 120.0,
    this.distanceFromOffice,
    this.isInClockInArea = false,
    this.isPopupVisible = false,
    this.errorMessage,
    this.userName,
    this.userImageUrl,
    this.dateJoined,
    this.clockInTime,
    this.clockOutTime,
  });

  /// نسخ الحالة مع تحديث بعض القيم
  ClockInLocationState copyWith({
    LocationStatus? status,
    LatLng? userLocation,
    LatLng? officeLocation,
    double? allowedRadius,
    double? distanceFromOffice,
    bool? isInClockInArea,
    bool? isPopupVisible,
    String? errorMessage,
    String? userName,
    String? userImageUrl,
    String? dateJoined,
    String? clockInTime,
    String? clockOutTime,
  }) {
    return ClockInLocationState(
      status: status ?? this.status,
      userLocation: userLocation ?? this.userLocation,
      officeLocation: officeLocation ?? this.officeLocation,
      allowedRadius: allowedRadius ?? this.allowedRadius,
      distanceFromOffice: distanceFromOffice ?? this.distanceFromOffice,
      isInClockInArea: isInClockInArea ?? this.isInClockInArea,
      isPopupVisible: isPopupVisible ?? this.isPopupVisible,
      errorMessage: errorMessage,
      userName: userName ?? this.userName,
      userImageUrl: userImageUrl ?? this.userImageUrl,
      dateJoined: dateJoined ?? this.dateJoined,
      clockInTime: clockInTime ?? this.clockInTime,
      clockOutTime: clockOutTime ?? this.clockOutTime,
    );
  }

  // ──────────────────────────────────────────────────────────────
  // Getters المساعدة
  // ──────────────────────────────────────────────────────────────

  /// هل الحالة في وضع التحميل؟
  bool get isLoading => status == LocationStatus.loading;

  /// هل الحالة في وضع الخطأ؟
  bool get hasError => status == LocationStatus.error;

  /// هل تم تحميل الموقع بنجاح؟
  bool get isLocationLoaded => status == LocationStatus.loaded;

  /// هل البيانات جاهزة للعرض؟
  bool get isReady => isLocationLoaded && userLocation != null;

  /// هل يمكن تسجيل الحضور؟
  bool get canClockIn => isInClockInArea && isReady;

  /// نص المسافة للعرض
  String get distanceText {
    if (distanceFromOffice == null) return "---";
    if (distanceFromOffice! < 1000) {
      return "${distanceFromOffice!.toStringAsFixed(0)} متر";
    } else {
      return "${(distanceFromOffice! / 1000).toStringAsFixed(2)} كم";
    }
  }

  /// إحداثيات الموقع للعرض
  String get locationCoordinates {
    if (userLocation == null) return "---";
    return "Lat ${userLocation!.latitude.toStringAsFixed(5)} Long ${userLocation!.longitude.toStringAsFixed(5)}";
  }

  @override
  List<Object?> get props => [
    status,
    userLocation,
    officeLocation,
    allowedRadius,
    distanceFromOffice,
    isInClockInArea,
    isPopupVisible,
    errorMessage,
    userName,
    userImageUrl,
    dateJoined,
    clockInTime,
    clockOutTime,
  ];
}