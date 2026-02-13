import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/ClockInFlowCubit.dart';
import '../../logic/ClockInFlowStatus.dart';
import 'ClockInMap.dart';
import 'ClockInPopup.dart';

class ClockInLocationScreen extends StatelessWidget {
  const ClockInLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClockInFlowCubit, ClockInFlowState>(
      listener: (context, state) {
        if (state.hasError && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
        if (state.isLocationLoading || !state.isLocationReady) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            title: 'Clock In Area',
            backgroundColor: ExtensionColors.transparentColor,
            showBackButton: true,
          ),
          body: Stack(
            children: [
              ClockInMap(
                userLocation: state.userLocation!,
                isPopupVisible: state.isPopupVisible,
                onMarkerTap: () {
                  context.read<ClockInFlowCubit>().togglePopup();
                },
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    if (state.isPopupVisible)
                      ClockInPopup(
                        userName: state.userName ?? "User",
                        userImageUrl: state.userImageUrl ?? "",
                        dateJoined: state.clockInTime ?? "---",
                        locationText: state.locationCoordinates,
                        clockInTime: state.clockInTime ?? "09:00",
                        clockOutTime: state.clockOutTime ?? "05:00",
                        isInClockInArea: state.isInClockInArea,
                      ),

                    Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: CustomPrimaryButton.gradient(
                        buttonText: 'Selfie To Clock In',
                        onPressed: state.canProceedToCamera
                            ? () {
                          context.read<ClockInFlowCubit>().initializeCamera();
                          context.push(RouteNames.selfieCamera);
                        }
                            : null,
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