import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import 'CameraStatus.dart';

part 'camera_preview_screen_state.dart';

class CameraPreviewScreenCubit extends BaseCubit<CameraPreviewScreenState> {
  CameraPreviewScreenCubit() : super(CameraPreviewScreenState());
  CameraController? _cameraController;

  Future<void> initializeCamera() async {
    try {
      updateState((s) =>
          s.copyWith(
            cameraStatus: CameraStatus.initial,
          )
      );
      final cameras = await availableCameras();
      final firstCamera = cameras.firstWhere(
              (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => cameras.first
      ) ;
      _cameraController = CameraController(
        firstCamera,
        ResolutionPreset.high,
        enableAudio: false
      );
      await _cameraController!.initialize();
      updateState((s) =>
          s.copyWith(
            cameraStatus: CameraStatus.ready,
            cameraController: _cameraController,
          )
      );
    } catch (e) {
      updateState((s) =>
          s.copyWith(
              cameraStatus: CameraStatus.error,
              errorMessage: "error initializing camera"
          )
      );
    }
  }

  Future<void> takePicture() async {
    try {
      if (_cameraController == null || !_cameraController!.value.isInitialized) {
        updateState((s) =>
            s.copyWith(
                cameraStatus: CameraStatus.error,
              errorMessage: "camera not initialized"
            )
        );
      }
      updateState((s) =>
          s.copyWith(
            cameraStatus: CameraStatus.capturing,
          )
      );
      final image = await _cameraController!.takePicture();
      updateState((s) =>
          s.copyWith(
            cameraStatus: CameraStatus.captured,
            capturedImage: image,
          )
      );

    } catch (e) {
      updateState((s) =>
          s.copyWith(
              cameraStatus: CameraStatus.error,
              errorMessage: "error taking picture"
          )
      );

    }

  }
  void retakePicture() {
    updateState(
            (s) =>
            s.copyWith(
              cameraStatus: CameraStatus.ready,
              capturedImage: null,
            )
    );
  }
  void clearError() {
    emit(state.copyWith(
      cameraStatus: CameraStatus.ready,
      errorMessage: null,
    ));
  }

  @override
  Future<void> close() {
    _cameraController?.dispose();
    return super.close();
  }
}
