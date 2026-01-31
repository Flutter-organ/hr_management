import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/ConfirmationCameraCubit.dart';
import '../../logic/ConfirmationCameraState.dart';
import '../../logic/attendance_screen_cubit.dart';

/// ✅ شاشة تأكيد الصورة وتسجيل الحضور - الشاشة الرابعة (الأخيرة) في الـ Flow
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
          // ✅ عند نجاح التسجيل
          if (state.isSuccess) {
            // ✅ إرسال إشعار للـ AttendanceScreenCubit عبر Stream
            try {
              final attendanceCubit = context.read<AttendanceScreenCubit>();
              attendanceCubit.notifyClockInSuccess(
                clockInTime: DateTime.now(),
                location: '${widget.location.latitude}, ${widget.location.longitude}',
                imagePath: widget.capturedImage.path,
              );
            } catch (e) {
              debugPrint('Error notifying attendance cubit: $e');
            }

            // عرض رسالة النجاح
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage ?? 'تم التسجيل بنجاح'),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );

            // ✅ العودة للشاشة الرئيسية (Attendance Screen)
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) {
                context.go(RouteNames.attendantScreen);
              }
            });
          }

          // عند حدوث خطأ
          if (state.hasError && state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
                action: SnackBarAction(
                  label: 'إعادة المحاولة',
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
            appBar: AppBar(
              title: const Text('تأكيد الصورة'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: state.isSubmitting
                    ? null
                    : () => context.pop(),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // عرض الصورة الملتقطة
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(widget.capturedImage.path),
                      fit: BoxFit.cover,
                      height: 400,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // بطاقة المعلومات
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'معلومات التسجيل',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _InfoRow(
                            icon: Icons.location_on,
                            label: 'خط العرض',
                            value: state.location['lat']?.toStringAsFixed(5) ??
                                'غير متاح',
                          ),
                          const SizedBox(height: 8),
                          _InfoRow(
                            icon: Icons.location_on,
                            label: 'خط الطول',
                            value: state.location['long']?.toStringAsFixed(5) ??
                                'غير متاح',
                          ),
                          const SizedBox(height: 8),
                          _InfoRow(
                            icon: Icons.access_time,
                            label: 'التاريخ والوقت',
                            value: state.dateTime,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // زرار إعادة التقاط الصورة
                  OutlinedButton.icon(
                    onPressed: state.isSubmitting
                        ? null
                        : () => context.pop(),
                    icon: const Icon(Icons.refresh),
                    label: const Text('إعادة التقاط الصورة'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // حقل الملاحظات
                  TextField(
                    controller: _notesController,
                    enabled: !state.isSubmitting,
                    decoration: const InputDecoration(
                      labelText: 'ملاحظات (اختياري)',
                      hintText: 'أضف أي ملاحظات هنا...',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.note_alt_outlined),
                    ),
                    maxLines: 3,
                    onChanged: (value) {
                      context.read<ConfirmationCameraCubit>().updateNotes(value);
                    },
                  ),

                  const SizedBox(height: 32),

                  // زرار تسجيل الحضور
                  ElevatedButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () {
                      context.read<ConfirmationCameraCubit>().submitClockIn(
                        image: widget.capturedImage,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey,
                    ),
                    child: state.isSubmitting
                        ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'جاري التسجيل...',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    )
                        : const Text(
                      'تسجيل الحضور',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Widget لعرض صف من المعلومات مع أيقونة
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.purple),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}