part of 'camera_preview_screen_cubit.dart';

class CameraPreviewScreenState extends Equatable {
  final CameraStatus cameraStatus;

  final CameraController? cameraController;

  final XFile? capturedImage;

  final String? errorMessage;

  final bool? isFlashOn;

  final double? currentZoomLevel;

  final double? maxZoomLevel;

  const CameraPreviewScreenState({
    this.cameraStatus = CameraStatus.initial,
    this.cameraController,
    this.capturedImage,
    this.errorMessage,
    this.isFlashOn = false,
    this.currentZoomLevel = 1.0,
    this.maxZoomLevel = 1.0,
  });

  CameraPreviewScreenState copyWith({
    CameraStatus? cameraStatus,
    CameraController? cameraController,
    XFile? capturedImage,
    String? errorMessage,
    bool? isFlashOn,
    double? currentZoomLevel,
    double? maxZoomLevel,
  }) {
    return CameraPreviewScreenState(
      cameraStatus: cameraStatus ?? this.cameraStatus,
      cameraController: cameraController ?? this.cameraController,
      capturedImage: capturedImage,
      errorMessage: errorMessage,
      isFlashOn: isFlashOn ?? this.isFlashOn,
      currentZoomLevel: currentZoomLevel ?? this.currentZoomLevel,
      maxZoomLevel: maxZoomLevel ?? this.maxZoomLevel,
    );
  }

  bool get isCameraReady => cameraStatus == CameraStatus.ready;

  bool get hasImage => capturedImage != null;

  bool get hasError => cameraStatus == CameraStatus.error;

  String get zoomText {
    return '${(currentZoomLevel ?? 1.0).toStringAsFixed(1)}x';
  }

  @override
  List<Object?> get props => [
    cameraStatus,
    cameraController,
    capturedImage,
    errorMessage,
    isFlashOn,
    currentZoomLevel,
    maxZoomLevel,
  ];
}