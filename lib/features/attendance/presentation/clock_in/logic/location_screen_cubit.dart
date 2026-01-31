import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import 'location_screen_state.dart';

class ClockInLocationCubit extends Cubit<ClockInLocationState> {
  ClockInLocationCubit({
    required LatLng officeLocation,
    double allowedRadius = 120000.0,
  }) : super(ClockInLocationState(
    officeLocation: officeLocation,
    allowedRadius: allowedRadius,
  ));

  Future<void> loadUserLocation() async {
    emit(state.copyWith(status: LocationStatus.loading));

    final permissionResult = await _ensureLocationPermission();
    if (permissionResult != null) {
      emit(permissionResult);
      return;
    }

    final position = await _getCurrentPosition();
    if (position == null) return;

    _handleLocationLoaded(position);

    await _loadUserData();
  }
  Future< ClockInLocationState?> _ensureLocationPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return state.copyWith(
        status: LocationStatus.error,
        errorMessage: "خدمة الموقع غير مفعلة. يرجى تفعيلها من الإعدادات",
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return state.copyWith(
          status: LocationStatus.error,
          errorMessage: "تم رفض إذن الوصول للموقع",
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return state.copyWith(
        status: LocationStatus.error,
        errorMessage:
        "تم رفض إذن الموقع بشكل دائم. يرجى تفعيله من إعدادات التطبيق",
      );
    }

    return null; // تمام
  }
  Future<Position?> _getCurrentPosition() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      emit(state.copyWith(
        status: LocationStatus.error,
        errorMessage: "فشل جلب الموقع",
      ));
      return null;
    }
  }
  void _handleLocationLoaded(Position position) {
    final userLocation = LatLng(position.latitude, position.longitude);
    final distance =
    _calculateDistance(userLocation, state.officeLocation);

    emit(state.copyWith(
      status: LocationStatus.loaded,
      userLocation: userLocation,
      distanceFromOffice: distance,
      isInClockInArea: distance <= state.allowedRadius,
    ));
  }



  /// حساب المسافة بين نقطتين (بالمتر)
  double _calculateDistance(LatLng point1, LatLng point2) {
    return Geolocator.distanceBetween(
      point1.latitude,
      point1.longitude,
      point2.latitude,
      point2.longitude,
    );
  }

  /// جلب بيانات المستخدم (من API أو Database)
  Future<void> _loadUserData() async {
    try {
      // TODO: استبدل هذا بالكود الحقيقي لجلب بيانات المستخدم
      /*
      final userResponse = await apiService.getUserProfile();
      final scheduleResponse = await apiService.getTodaySchedule();
      */

      // بيانات تجريبية
      await Future.delayed(const Duration(milliseconds: 500));

      emit(state.copyWith(
        userName: "Tonald Drump",
        userImageUrl: "https://i.pravatar.cc/150",
        dateJoined: "29 September 2024",
        clockInTime: "09:00",
        clockOutTime: "05:00",
      ));
    } catch (e) {
      // في حالة فشل جلب بيانات المستخدم، نستمر بدون بيانات
      // ولا نغير status لأن الموقع تم جلبه بنجاح
      emit(state.copyWith(
        errorMessage: "تعذر جلب بيانات المستخدم",
      ));
    }
  }

  /// تبديل حالة ظهور الـ Popup
  void togglePopup() {
    emit(state.copyWith(isPopupVisible: !state.isPopupVisible));
  }

  /// إظهار الـ Popup
  void showPopup() {
    emit(state.copyWith(isPopupVisible: true));
  }

  /// إخفاء الـ Popup
  void hidePopup() {
    emit(state.copyWith(isPopupVisible: false));
  }

  /// تحديث الموقع (للتحديث المستمر)
  Future<void> refreshLocation() async {
    // لا نغير الحالة إلى loading لتجنب إعادة بناء الـ UI بالكامل
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final userLocation = LatLng(position.latitude, position.longitude);
      final distance = _calculateDistance(userLocation, state.officeLocation);
      final isInClockInArea = distance <= state.allowedRadius;

      emit(state.copyWith(
        userLocation: userLocation,
        distanceFromOffice: distance,
        isInClockInArea: isInClockInArea,
      ));
    } catch (e) {
      // في حالة فشل التحديث، نبقي على الموقع السابق
      emit(state.copyWith(
        errorMessage: "فشل تحديث الموقع",
      ));
    }
  }

  /// مسح رسالة الخطأ
  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }

  /// إعادة المحاولة (في حالة الخطأ)
  Future<void> retry() async {
    await loadUserLocation();
  }
}