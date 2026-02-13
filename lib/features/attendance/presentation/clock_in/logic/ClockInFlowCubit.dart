import 'package:camera/camera.dart';

import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/enitity/attendanceclockIn.dart';
import '../../../domain/use_case/GetCurrentLocationUseCase.dart';
import '../../../domain/use_case/attendance_clock_in_use_case.dart';
import '../../../domain/use_case/getUserInfoUseCase.dart';
import 'ClockInFlowStatus.dart';

class ClockInFlowCubit extends BaseCubit<ClockInFlowState> {
  final GetCurrentLocationUseCase _getCurrentLocation;
  final GetUserInfoUseCase _getUserInfo;
  final ClockInAttendanceUseCase _clockInAttendance;


  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  double _minZoomLevel = 1.0;

  ClockInFlowCubit({
    required GetCurrentLocationUseCase getCurrentLocation,
    required GetUserInfoUseCase getUserInfo,
    required ClockInAttendanceUseCase clockInAttendance,
  })  : _getCurrentLocation = getCurrentLocation,
        _getUserInfo = getUserInfo,
        _clockInAttendance = clockInAttendance,
        super(ClockInFlowState()) {
    _initLocation();
  }

  // ═══════════════════════════════════════════════════════════
  // 🗺️ STEP 1: LOCATION SCREEN
  // ═══════════════════════════════════════════════════════════

  Future<void> _initLocation() async {
    updateState((s) => s.copyWith(status: ClockInFlowStatus.loadingLocation));

    await _loadUserData();
    await _loadUserLocation();
  }


  Future<void> _loadUserData() async {
    await execute(
      onLoading: () {},
      call: () => _getUserInfo(),
      onSuccess: (user) {
        updateState((s) => s.copyWith(
          userName: user.firstname,
          userImageUrl: user.imageUser,
        ));
      },
      onError: (e) {
        updateState((s) => s.copyWith(errorMessage: e.message));
      },
    );
  }

  Future<void> _loadUserLocation() async {
    await execute(
      onLoading: () {},
      call: () => _getCurrentLocation(),
      onSuccess: (location) async {
        updateState((s) => s.copyWith(
            userLocation: location,
            status: ClockInFlowStatus.locationReady,
            isInClockInArea: true
        ));
      },
      onError: (e) {
        updateState((s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: e.message,
        ));
      },
    );
  }


  void togglePopup() {
    updateState((s) => s.copyWith(isPopupVisible: !state.isPopupVisible));
  }

  // ═══════════════════════════════════════════════════════════
  // 📸 STEP 2: CAMERA SCREEN
  // ═══════════════════════════════════════════════════════════

  Future<void> initializeCamera() async {
    try {
      updateState((s) => s.copyWith(status: ClockInFlowStatus.loadingCamera));

      _cameras = await availableCameras();

      if (_cameras == null || _cameras!.isEmpty) {
        updateState((s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: "No cameras found",
        ));
        return;
      }

      // اختيار الكاميرا الأمامية
      int cameraIndex = _cameras!.indexWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      if (cameraIndex == -1) cameraIndex = 0;

      await _setupCamera(_cameras![cameraIndex]);
    } catch (e) {
      updateState((s) => s.copyWith(
        status: ClockInFlowStatus.error,
        errorMessage: "Camera initialization failed: $e",
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

    final maxZoom = await _cameraController!.getMaxZoomLevel();
    _minZoomLevel = await _cameraController!.getMinZoomLevel();

    updateState((s) => s.copyWith(
      status: ClockInFlowStatus.cameraReady,
      cameraController: _cameraController,
      currentZoomLevel: _minZoomLevel,
      maxZoomLevel: maxZoom,
      isFlashOn: false,
    ));
  }

  Future<void> takePicture() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      updateState((s) => s.copyWith(
        status: ClockInFlowStatus.error,
        errorMessage: "Camera not ready",
      ));
      return;
    }

    try {
      updateState((s) => s.copyWith(status: ClockInFlowStatus.capturingPhoto));

      final image = await _cameraController!.takePicture();

      updateState((s) => s.copyWith(
        status: ClockInFlowStatus.photoCaptured,
        capturedImage: image,
      ));
    } catch (e) {
      updateState((s) => s.copyWith(
        status: ClockInFlowStatus.error,
        errorMessage: "Failed to capture photo: $e",
      ));
    }
  }

  Future<void> toggleFlash() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      final newFlashMode = state.isFlashOn ? FlashMode.off : FlashMode.torch;
      await _cameraController!.setFlashMode(newFlashMode);

      updateState((s) => s.copyWith(isFlashOn: !state.isFlashOn));
    } catch (e) {
      print("Flash toggle error: $e");
    }
  }

  Future<void> adjustZoom() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      double newZoom;

      if (state.currentZoomLevel == _minZoomLevel) {
        newZoom = (state.maxZoomLevel + _minZoomLevel) / 2;
      } else if (state.currentZoomLevel < state.maxZoomLevel) {
        newZoom = state.maxZoomLevel;
      } else {
        newZoom = _minZoomLevel;
      }

      await _cameraController!.setZoomLevel(newZoom);
      updateState((s) => s.copyWith(currentZoomLevel: newZoom));
    } catch (e) {
      print("Zoom error: $e");
    }
  }

  void retakePicture() {
    updateState((s) => s.copyWith(
      status: ClockInFlowStatus.cameraReady,
      capturedImage: null,
    ));
  }

  // ═══════════════════════════════════════════════════════════
  // ✅ STEP 3: CONFIRMATION SCREEN
  // ═══════════════════════════════════════════════════════════

  void updateNotes(String notes) {
    updateState((s) => s.copyWith(notes: notes));
  }

  Future<void> submitClockIn() async {
    final image = state.capturedImage;
    final location = state.userLocation;

    if (image == null || location == null) {
      updateState((s) => s.copyWith(
        status: ClockInFlowStatus.error,
        errorMessage: "الصورة أو الموقع غير متوفرين",
      ));
      return;
    }

    updateState((s) =>
        s.copyWith(status: ClockInFlowStatus.submittingClockIn));

    await execute(
      call: () => _clockInAttendance(
        attendanceClockIn: AttendanceClockIn(
          latitude: location.latitude,
          longitude: location.longitude,
          notes: state.notes ?? "",
          proofImage: image.path,
        ),
      ),
      onSuccess: (_) {
        updateState((s) => s.copyWith(
          status: ClockInFlowStatus.success,
          submissionTime: DateTime.now(),
        ));
      },
      onError: (e) {
        updateState((s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: e.message,
        ));
      },
    );
  }

  void clearError() {
    if (state.hasError) {
      updateState((s) => s.copyWith(
        status: ClockInFlowStatus.locationReady,
        errorMessage: null,
      ));
    }
  }
  @override
  Future<void> close() {
    _cameraController?.dispose();
    return super.close();
  }
}