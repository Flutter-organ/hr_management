import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/enitity/UserLocation.dart';

enum ClockInFlowStatus {
  initial,
  loadingLocation,
  locationReady,
  loadingCamera,
  cameraReady,
  capturingPhoto,
  photoCaptured,
  submittingClockIn,
  success,
  error,
}

class ClockInFlowState extends Equatable {
  // 🔹 Overall Status
  final ClockInFlowStatus status;
  final String? errorMessage;

  // 🔹 Location Data (Step 1)
  final Location? userLocation;
  final bool isInClockInArea;
  final bool isPopupVisible;

  // 🔹 User Info
  final String? userName;
  final String? userImageUrl;
  final String? clockInTime;
  final String? clockOutTime;

  // 🔹 Camera Data (Step 2)
  final CameraController? cameraController;
  final XFile? capturedImage;
  final bool isFlashOn;
  final double currentZoomLevel;
  final double maxZoomLevel;

  // 🔹 Confirmation Data (Step 3)
  final String? notes;
  final DateTime? submissionTime;

  const ClockInFlowState({
    this.status = ClockInFlowStatus.initial,
    this.errorMessage,

    // Location
    this.userLocation,
    this.isInClockInArea = false,
    this.isPopupVisible = false,

    // User
    this.userName,
    this.userImageUrl,
    this.clockInTime,
    this.clockOutTime,

    // Camera
    this.cameraController,
    this.capturedImage,
    this.isFlashOn = false,
    this.currentZoomLevel = 1.0,
    this.maxZoomLevel = 1.0,

    // Confirmation
    this.notes,
    this.submissionTime,
  });

  ClockInFlowState copyWith({
    ClockInFlowStatus? status,
    String? errorMessage,
    Location? userLocation,
    Location? officeLocation,
    double? allowedRadius,
    double? distanceFromOffice,
    bool? isInClockInArea,
    bool? isPopupVisible,
    String? userName,
    String? userImageUrl,
    String? clockInTime,
    String? clockOutTime,
    CameraController? cameraController,
    XFile? capturedImage,
    bool? isFlashOn,
    double? currentZoomLevel,
    double? maxZoomLevel,
    String? notes,
    DateTime? submissionTime,
  }) {
    return ClockInFlowState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      userLocation: userLocation ?? this.userLocation,
      isInClockInArea: isInClockInArea ?? this.isInClockInArea,
      isPopupVisible: isPopupVisible ?? this.isPopupVisible,
      userName: userName ?? this.userName,
      userImageUrl: userImageUrl ?? this.userImageUrl,
      clockInTime: clockInTime ?? this.clockInTime,
      clockOutTime: clockOutTime ?? this.clockOutTime,
      cameraController: cameraController ?? this.cameraController,
      capturedImage: capturedImage ?? this.capturedImage,
      submissionTime: submissionTime ?? this.submissionTime,
      isFlashOn: isFlashOn ?? this.isFlashOn,
      currentZoomLevel: currentZoomLevel ?? this.currentZoomLevel,
      maxZoomLevel: maxZoomLevel ?? this.maxZoomLevel,
      notes: notes ?? this.notes,
    );
  }

  // 🔹 Getters
  bool get isLocationLoading => status == ClockInFlowStatus.loadingLocation;
  bool get isLocationReady => status == ClockInFlowStatus.locationReady;
  bool get isCameraReady => status == ClockInFlowStatus.cameraReady;
  bool get isCapturing => status == ClockInFlowStatus.capturingPhoto;
  bool get hasImage => capturedImage != null;
  bool get isSubmitting => status == ClockInFlowStatus.submittingClockIn;
  bool get isSuccess => status == ClockInFlowStatus.success;
  bool get hasError => status == ClockInFlowStatus.error;

  bool get canProceedToCamera =>
      isLocationReady && userLocation != null && isInClockInArea;

  bool get canSubmitClockIn =>
      hasImage && userLocation != null;

  String get locationCoordinates {
    if (userLocation == null) return "---";
    return "Lat ${userLocation!.latitude.toStringAsFixed(5)} Long ${userLocation!.longitude.toStringAsFixed(5)}";
  }

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    userLocation,
    isInClockInArea,
    isPopupVisible,
    userName,
    userImageUrl,
    clockInTime,
    clockOutTime,
    cameraController,
    capturedImage,
    isFlashOn,
    currentZoomLevel,
    maxZoomLevel,
    notes,
    submissionTime,
  ];
}