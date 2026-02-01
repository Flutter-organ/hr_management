import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/location_screen_cubit.dart';
import '../../logic/location_screen_state.dart';
import 'ClockInMap.dart';
import 'ClockInPopup.dart';

class ClockInScreen extends StatelessWidget {
  const ClockInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider<ClockInLocationCubit>(
      create: (context) => sl<ClockInLocationCubit>(),
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

      },
      builder: (context, state) {
        if (state.isLoading || !state.isReady) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('loading your location'),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar:CustomAppBar(
            title: 'Clock In Area',
            backgroundColor:ExtensionColors.transparentColor ,
            showBackButton: true ,
            leadingBackgroundColor: context.colors.purple50,
          ),
          body: Stack(
            children: [
              ClockInMap(
                userLocation: state.userLocation!,
                isPopupVisible: state.isPopupVisible,

                onMarkerTap: () {
                  context.read<ClockInLocationCubit>().togglePopup();
                },
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (state.isPopupVisible)
                      ClockInPopup(
                        userName: state.userName ?? "user",
                        userImageUrl: state.userImageUrl ?? " ",
                        dateJoined: state.dateJoined ?? "---",
                        locationText: state.locationCoordinates,
                        clockInTime: state.clockInTime ?? "09:00",
                        clockOutTime: state.clockOutTime ?? "05:00",
                        isInClockInArea: state.isInClockInArea,
                        distanceText: state.distanceText,
                      ),

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
                        onPressed: ()=>
                        {
                          context.push(
                            RouteNames.selfieCamera,
                            extra: {
                              'lat': state.userLocation?.latitude,
                              'long': state.userLocation?.longitude,
                            },
                          )
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}