import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/CameraStatus.dart';
import '../../logic/camera_preview_screen_cubit.dart';

/// ✅ شاشة التقاط الصورة - الشاشة الثالثة في الـ Flow
class CameraPreviewScreen extends StatelessWidget {
  final LatLng location;

  const CameraPreviewScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraPreviewScreenCubit()..initializeCamera(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<
              CameraPreviewScreenCubit,
              CameraPreviewScreenState>(
            listener: (context, state) {
              // ✅ عند التقاط الصورة بنجاح، الانتقال لشاشة التأكيد
              if (state.cameraStatus == CameraStatus.captured &&
                  state.hasImage) {
                // ✅ استخدام GoRouter مع تمرير البيانات
                context.push(
                  RouteNames.confirmationScreen,
                  extra: {
                    'capturedImage': state.capturedImage!,
                    'lat': location.latitude,
                    'long': location.longitude,
                  },
                );
              }

              // عرض رسالة خطأ إن وجدت
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
              final cameraPreviewCubit =
              context.read<CameraPreviewScreenCubit>();

              // حالة التحميل
              if (state.cameraStatus == CameraStatus.initial ||
                  state.cameraStatus == CameraStatus.loading) {
                return const Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('جاري تحميل الكاميرا...'),
                      ],
                    ),
                  ),
                );
              }

              // حالة الخطأ
              if (state.hasError) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('خطأ في الكاميرا'),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.errorMessage ?? 'حدث خطأ غير متوقع',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: () {
                            cameraPreviewCubit.initializeCamera();
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('إعادة المحاولة'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // شاشة الكاميرا
              return Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: const Text("Selfie To Clock In"),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                  ),
                ),
                body: Stack(
                  fit: StackFit.expand,
                  children: [
                    // معاينة الكاميرا
                    if (state.cameraController != null &&
                        state.cameraController!.value.isInitialized)
                      CameraPreview(state.cameraController!),

                    // زرار التقاط الصورة
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: FloatingActionButton(
                          backgroundColor: Colors.purple,
                          onPressed: state.cameraStatus == CameraStatus.capturing
                              ? null
                              : cameraPreviewCubit.takePicture,
                          child: state.cameraStatus == CameraStatus.capturing
                              ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                              : const Icon(Icons.camera_alt, size: 36),
                        ),
                      ),
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