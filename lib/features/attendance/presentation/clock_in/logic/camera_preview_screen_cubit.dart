import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import 'CameraStatus.dart';

part 'camera_preview_screen_state.dart';

class CameraPreviewScreenCubit extends BaseCubit<CameraPreviewScreenState> {
  CameraPreviewScreenCubit() : super(const CameraPreviewScreenState());

  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  int _currentCameraIndex = 0;
  double _currentZoomLevel = 1.0;
  double _maxZoomLevel = 1.0;
  double _minZoomLevel = 1.0;

  Future<void> initializeCamera() async {
    try {
      updateState((s) => s.copyWith(cameraStatus: CameraStatus.loading));

      _cameras = await availableCameras();

      if (_cameras == null || _cameras!.isEmpty) {
        updateState((s) => s.copyWith(
          cameraStatus: CameraStatus.error,
          errorMessage: "No cameras found",
        ));
        return;
      }

      _currentCameraIndex = _cameras!.indexWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      if (_currentCameraIndex == -1) {
        _currentCameraIndex = 0;
      }

      await _setupCamera(_cameras![_currentCameraIndex]);
    } catch (e) {
      updateState((s) => s.copyWith(
        cameraStatus: CameraStatus.error,
        errorMessage: "Error initializing camera: $e",
      ));
    }
  }

  Future<void> _setupCamera(CameraDescription camera) async {
    await _cameraController?.dispose();

    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await _cameraController!.initialize();

    await _cameraController!.setFlashMode(FlashMode.off);

    _maxZoomLevel = await _cameraController!.getMaxZoomLevel();
    _minZoomLevel = await _cameraController!.getMinZoomLevel();
    _currentZoomLevel = _minZoomLevel;

    updateState((s) => s.copyWith(
      cameraStatus: CameraStatus.ready,
      cameraController: _cameraController,
      isFlashOn: false,
      currentZoomLevel: _currentZoomLevel,
      maxZoomLevel: _maxZoomLevel,
    ));
  }

  Future<void> takePicture() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      updateState((s) => s.copyWith(
        cameraStatus: CameraStatus.error,
        errorMessage: "Camera not initialized",
      ));
      return;
    }

    try {
      updateState((s) => s.copyWith(cameraStatus: CameraStatus.capturing));

      final image = await _cameraController!.takePicture();

      updateState((s) => s.copyWith(
        cameraStatus: CameraStatus.captured,
        capturedImage: image,
      ));
    } catch (e) {
      updateState((s) => s.copyWith(
        cameraStatus: CameraStatus.error,
        errorMessage: "Error taking picture: $e",
      ));
    }
  }

  Future<void> toggleFlash() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      final currentFlashState = state.isFlashOn ?? false;
      final newFlashMode = currentFlashState ? FlashMode.off : FlashMode.torch;

      await _cameraController!.setFlashMode(newFlashMode);

      updateState((s) => s.copyWith(isFlashOn: !currentFlashState));
    } catch (e) {
      print("Flash toggle error: $e");
    }
  }

  Future<void> adjustZoom() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      double newZoomLevel;

      if (_currentZoomLevel == _minZoomLevel) {
        newZoomLevel = (_minZoomLevel + _maxZoomLevel) / 2;
      } else if (_currentZoomLevel < _maxZoomLevel) {
        newZoomLevel = _maxZoomLevel;
      } else {
        newZoomLevel = _minZoomLevel;
      }

      newZoomLevel = newZoomLevel.clamp(_minZoomLevel, _maxZoomLevel);

      await _cameraController!.setZoomLevel(newZoomLevel);
      _currentZoomLevel = newZoomLevel;

      updateState((s) => s.copyWith(currentZoomLevel: newZoomLevel));
    } catch (e) {
      print("Zoom error: $e");
    }
  }

  Future<void> setZoomLevel(double zoomLevel) async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      final clampedZoom = zoomLevel.clamp(_minZoomLevel, _maxZoomLevel);
      await _cameraController!.setZoomLevel(clampedZoom);
      _currentZoomLevel = clampedZoom;

      updateState((s) => s.copyWith(currentZoomLevel: clampedZoom));
    } catch (e) {
      print("Set zoom error: $e");
    }
  }

  void retakePicture() {
    updateState((s) => s.copyWith(
      cameraStatus: CameraStatus.ready,
      capturedImage: null,
    ));
  }

  void clearError() {
    updateState((s) => s.copyWith(
      cameraStatus: CameraStatus.ready,
      errorMessage: null,
    ));
  }


  String get zoomText {
    return '${_currentZoomLevel.toStringAsFixed(1)}x';
  }

  @override
  Future<void> close() {
    _cameraController?.dispose();
    return super.close();
  }
}