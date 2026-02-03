import 'dart:io';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/presentation/design_system/components/app_bar.dart';
import 'package:hr_management/core/presentation/design_system/theme/helper/extention_colors.dart';
import 'package:hr_management/core/presentation/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/ConfirmationCameraCubit.dart';
import '../../logic/ConfirmationCameraState.dart';
import '../../logic/attendance_screen_cubit.dart';

/// شاشة تأكيد الصورة وتسجيل الحضور - محدثة
class ConfirmationScreen extends StatefulWidget {
  final XFile capturedImage;
  final LatLng location;

  const ConfirmationScreen({
    super.key,
    required this.capturedImage,
    required this.location,
  });

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmationCameraCubit(
        location: {
          'lat': widget.location.latitude,
          'long': widget.location.longitude,
        },
      ),
      child: BlocConsumer<ConfirmationCameraCubit, ConfirmationCameraState>(
        listener: (context, state) {
          if (state.isSuccess) {
            try {
              final attendanceCubit = context.read<AttendanceScreenCubit>();
              attendanceCubit.notifyClockInSuccess(
                clockInTime: DateTime.now(),
                location:
                '${widget.location.latitude}, ${widget.location.longitude}',
                imagePath: widget.capturedImage.path,
              );
            } catch (e) {
              debugPrint('Error notifying attendance cubit: $e');
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage ?? 'تم التسجيل بنجاح'),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );

            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) {
                context.go(RouteNames.attendantScreen);
              }
            });
          }

          if (state.hasError && state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
                action: SnackBarAction(
                  label: 'Retry'.tr(),
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<ConfirmationCameraCubit>().clearError();
                  },
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.colors.gray50,
            appBar: CustomAppBar(
              title: "Selfie To Clock In",
              backgroundColor: context.colors.white,
              showBackButton: true,
              leadingBackgroundColor: context.colors.purple50,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                decoration: BoxDecoration(
                  color: context.colors.gray200
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  File(widget.capturedImage.path),
                                  fit: BoxFit.cover,
                                  width:334,
                                  height: 440,
                                ),
                              ),

                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        ExtensionColors.transparentColor,
                                        context.colors.black.withOpacity(0.5),
                                      ],
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lat : ${widget.location.latitude.toStringAsFixed(5)}',
                                        style: context.textTheme.labelMediumFont.copyWith(
                                          color: context.colors.white,
                                      )
                                      ),
                                      Text(
                                        'Long : ${widget.location.longitude.toStringAsFixed(5)}',
                                          style: context.textTheme.labelMediumFont.copyWith(
                                            color: context.colors.white,
                                          )
                                      ),
                                      Text(
                                          formatDate(DateTime.now()),
                                          style: context.textTheme.labelMediumFont.copyWith(
                                            color: context.colors.white,
                                          )
                                      ),
                                      const SizedBox(height: 16),

                                      CustomPrimaryButton.gradient(
                                        height: 52,
                                        textStyle: context.textTheme.labelLargeFont.copyWith(
                                          color: context.colors.white
                                        ),
                                        buttonText: 'Retake Photo',
                                        borderRadius: 100,
                                          onPressed: state.isSubmitting
                                                ? null
                                                : () => context.pop(),
                                        icon: Icon(
                                          Iconsax.refresh_circle4,
                                          size: 20,
                                          color: context.colors.white,
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                          CustomInputField(
                            contentPaddingVertical: 50,
                            label: "Clock-in Notes (Optional)".tr(),
                            labelColor: context.colors.gray600,
                            hintKey: 'Clock-in Notes'.tr(),
                            controller: _notesController,
                            maxLines: 4,
                            onChanged: (value) {
                              context
                                  .read<ConfirmationCameraCubit>()
                                  .updateNotes(value);
                            },
                            height: 120,
                          ),
                    ],
                  ),
                ),
              ),
            ),

            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colors.white,
              ),
              child: SafeArea(
                child: CustomPrimaryButton.gradient(
                  height: 52,
                  textStyle: context.textTheme.labelLargeFont.copyWith(
                    color: context.colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  buttonText: state.isSubmitting
                      ? 'Submitting...'.tr()
                      : 'Clock In'.tr(),
                  borderRadius: 100,
                  onPressed: state.isSubmitting
                      ? null
                      : () {
                    context
                        .read<ConfirmationCameraCubit>()
                        .submitClockIn(image: widget.capturedImage);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
String formatDate(DateTime dateTime) {
  final datePart = DateFormat('dd/MM/yy hh:mma').format(dateTime);
  return '$datePart GMT +07:00';
}