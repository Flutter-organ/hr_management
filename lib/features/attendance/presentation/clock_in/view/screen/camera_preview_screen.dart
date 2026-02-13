import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/presentation/design_system/components/app_bar.dart';
import 'package:hr_management/core/presentation/design_system/theme/helper/extention_colors.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/ClockInFlowCubit.dart';
import '../../logic/ClockInFlowStatus.dart';
import 'CameraControlButtons.dart';

class CameraPreviewScreen extends StatelessWidget {
  const CameraPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClockInFlowCubit, ClockInFlowState>(
      listener: (context, state) {
        if (state.status == ClockInFlowStatus.photoCaptured && state.hasImage) {
          context.push(RouteNames.confirmationScreen);
        }

        if (state.hasError && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<ClockInFlowCubit>();

        if (state.status == ClockInFlowStatus.loadingCamera) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: CustomAppBar(
            title: "Camera",
            backgroundColor: ExtensionColors.backgroundCamera,
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
                isCapturing: state.isCapturing,
                isFlashOn: state.isFlashOn,
              ),
            ],
          ),
        );
      },
    );
  }
}