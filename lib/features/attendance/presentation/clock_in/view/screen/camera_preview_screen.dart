import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/presentation/design_system/components/app_bar.dart';
import 'package:hr_management/core/presentation/design_system/theme/helper/extention_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/CameraStatus.dart';
import '../../logic/camera_preview_screen_cubit.dart';
import 'CameraControlButtons.dart';

class CameraPreviewScreen extends StatelessWidget {
  final LatLng location;

  const CameraPreviewScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraPreviewScreenCubit()..initializeCamera(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<CameraPreviewScreenCubit, CameraPreviewScreenState>(
            listener: (context, state) {
              if (state.cameraStatus == CameraStatus.captured && state.hasImage) {
                context.push(
                  RouteNames.confirmationScreen,
                  extra: {
                    'capturedImage': state.capturedImage!,
                    'lat': location.latitude,
                    'long': location.longitude,
                  },
                );
              }

              if (state.hasError && state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                    backgroundColor: Colors.red,
                  ),
                );
                context.read<CameraPreviewScreenCubit>().clearError();
              }
            },
            builder: (context, state) {
              final cubit = context.read<CameraPreviewScreenCubit>();

              if (state.cameraStatus == CameraStatus.initial ||
                  state.cameraStatus == CameraStatus.loading) {
                return Scaffold(
                  backgroundColor: ExtensionColors.backgroundCamera,
                  body: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(height: 16),
                        Text(
                          'loading camera',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              }


              return Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: ExtensionColors.backgroundCamera,

                appBar: CustomAppBar(
                  backgroundColor: ExtensionColors.backgroundCamera,
                  foregroundColor: Colors.white,
                  title: "Camera",

                  leading: IconButton(
                    icon: Icon(
                      state.isFlashOn ?? false
                          ? Iconsax.flash_1
                          : Iconsax.flash_slash,
                      size: 28,
                    ),
                    onPressed: () => cubit.toggleFlash(),
                  ),

                  actions: [
                    IconButton(
                      icon: const Icon(Iconsax.close_circle, size: 28),
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),

                body: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (state.cameraController != null &&
                        state.cameraController!.value.isInitialized)
                      CameraPreview(state.cameraController!),

                    CameraControlButtons(
                      onCapture: () => cubit.takePicture(),
                      onFlashToggle: () => cubit.toggleFlash(),
                      onZoom: () => cubit.adjustZoom(),
                      isCapturing: state.cameraStatus == CameraStatus.capturing,
                      isFlashOn: state.isFlashOn ?? false,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}