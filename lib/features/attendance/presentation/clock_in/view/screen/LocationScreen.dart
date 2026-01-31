import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/location_screen_cubit.dart';
import '../../logic/location_screen_state.dart';
import 'ClockInMap.dart';
import 'ClockInPopup.dart';

/// ✅ شاشة تسجيل الحضور مع الخريطة - الشاشة الثانية في الـ Flow
class ClockInScreen extends StatelessWidget {
  const ClockInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // موقع المكتب (يمكن جلبه من API أو إعدادات التطبيق)
    final officeLocation = LatLng(30.16115, 31.28568);

    return BlocProvider(
      create: (context) => ClockInLocationCubit(
        officeLocation: officeLocation,
        allowedRadius: 120000.0,
      )..loadUserLocation(),
      child: const _ClockInScreenContent(),
    );
  }
}

class _ClockInScreenContent extends StatelessWidget {
  const _ClockInScreenContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClockInLocationCubit, ClockInLocationState>(
      listener: (context, state) {
        if (state.hasError && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: 'إعادة المحاولة',
                textColor: Colors.white,
                onPressed: () {
                  context.read<ClockInLocationCubit>().retry();
                },
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        // شاشة التحميل
        if (state.isLoading || !state.isReady) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('جاري تحميل موقعك...'),
                ],
              ),
            ),
          );
        }

        // شاشة الخطأ
        if (state.hasError && state.userLocation == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('خطأ في الموقع'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_off,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.errorMessage ?? 'حدث خطأ في جلب الموقع',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<ClockInLocationCubit>().retry();
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        // الشاشة الرئيسية مع الخريطة
        return Scaffold(
          appBar: AppBar(
            title: Text('Clock In Area'.tr()),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
          ),
          body: Stack(
            children: [
              // الخريطة
              ClockInMap(
                userLocation: state.userLocation!,
                officeLocation: state.officeLocation,
                isPopupVisible: state.isPopupVisible,
                onMarkerTap: () {
                  context.read<ClockInLocationCubit>().togglePopup();
                },
              ),

              // الـ Popup والزر في الأسفل
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // الـ Popup (إذا كان ظاهراً)
                    if (state.isPopupVisible)
                      ClockInPopup(
                        userName: state.userName ?? "المستخدم",
                        userImageUrl: state.userImageUrl ??
                            "https://i.pravatar.cc/150",
                        dateJoined: state.dateJoined ?? "---",
                        locationText: state.locationCoordinates,
                        clockInTime: state.clockInTime ?? "09:00",
                        clockOutTime: state.clockOutTime ?? "05:00",
                        isInClockInArea: state.isInClockInArea,
                        distanceText: state.distanceText,
                      ),

                    // ✅ زرار Selfie to Clock In
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.white,
                      ),
                      child: CustomPrimaryButton.gradient(
                        height: 48,
                        textStyle: context.textTheme.labelLargeFont.copyWith(
                          color: context.colors.white,
                        ),
                        buttonText: 'Selfie To Clock In'.tr(),
                        borderRadius: 100,
                        onPressed: state.canClockIn
                            ? () {
                          // ✅ تمرير البيانات للشاشة التالية باستخدام GoRouter
                          context.push(
                            RouteNames.selfieCamera,
                            extra: {
                              'lat': state.userLocation!.latitude,
                              'long': state.userLocation!.longitude,
                            },
                          );
                        }
                            : null,
                      ),
                    ),
                  ],
                ),
              ),

              // زرار تحديث الموقع
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                right: 16,
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    context.read<ClockInLocationCubit>().refreshLocation();
                  },
                  child: const Icon(
                    Icons.my_location,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}