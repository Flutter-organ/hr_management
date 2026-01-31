part of 'camera_preview_screen_cubit.dart';

class CameraPreviewScreenState extends Equatable {
  /// حالة الكاميرا الحالية
  final CameraStatus cameraStatus;

  /// controller الكاميرا (يُستخدم في واجهة المستخدم)
  final CameraController? cameraController;

  /// الصورة الملتقطة
  final XFile? capturedImage;

  /// رسالة الخطأ إن وجدت
  final String? errorMessage;

  const CameraPreviewScreenState({
    this.cameraStatus = CameraStatus.initial,
    this.cameraController,
    this.capturedImage,
    this.errorMessage,
  });

  /// نسخ الحالة مع تحديث بعض القيم
  CameraPreviewScreenState copyWith({
    CameraStatus? cameraStatus,
    CameraController? cameraController,
    XFile? capturedImage,
    String? errorMessage,
  }) {
    return CameraPreviewScreenState(
      cameraStatus: cameraStatus ?? this.cameraStatus,
      cameraController: cameraController ?? this.cameraController,
      capturedImage: capturedImage,
      errorMessage: errorMessage,
    );
  }

  /// التحقق من أن الكاميرا جاهزة
  bool get isCameraReady => cameraStatus == CameraStatus.ready;

  /// التحقق من أن هناك صورة ملتقطة
  bool get hasImage => capturedImage != null;

  /// التحقق من وجود خطأ
  bool get hasError => cameraStatus == CameraStatus.error;

  @override
  List<Object?> get props => [cameraStatus, cameraController, capturedImage, errorMessage];
}