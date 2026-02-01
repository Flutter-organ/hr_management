import 'package:equatable/equatable.dart';
import 'package:hr_management/features/attendance/domain/enitity/UserLocation.dart';

enum LocationStatus {
  initial,
  loading,
  loaded,
  error,
}

class ClockInLocationState extends Equatable {
  final LocationStatus status;
  final Location? userLocation;
  final Location? officeLocation;
  final double allowedRadius;
  final double? distanceFromOffice;
  final bool isInClockInArea;
  final bool isPopupVisible;
  final String? errorMessage;


  final String? userName;
  final String? userImageUrl;
  final String? dateJoined;

  final String? clockInTime;
  final String? clockOutTime;

  const ClockInLocationState({
    this.status = LocationStatus.initial,
    this.userLocation,
    this.officeLocation,
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

  ClockInLocationState copyWith({
    LocationStatus? status,
    Location? userLocation,
    Location? officeLocation,
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


  bool get isLoading => status == LocationStatus.loading;

  bool get hasError => status == LocationStatus.error;

  bool get isLocationLoaded => status == LocationStatus.loaded;

  bool get isReady => isLocationLoaded && userLocation != null;

  bool get canClockIn => isInClockInArea && isReady;

  String get distanceText {
    if (distanceFromOffice == null) return "---";
    if (distanceFromOffice! < 1000) {
      return "${distanceFromOffice!.toStringAsFixed(0)}m";
    } else {
      return "${(distanceFromOffice! / 1000).toStringAsFixed(2)}km";
    }
  }

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