import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/components/header_banner.dart';
import '../../../../../../core/presentation/design_system/components/home_banner.dart';
import '../../../../../../core/presentation/design_system/components/summary_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/attendance_screen_cubit.dart';
import '../../logic/attendance_screen_state.dart';

class ClockInBanner extends StatelessWidget {
  final AttendanceScreenCubit attendanceScreenCubit;
  final AttendanceScreenState attendanceScreenState;
  final VoidCallback onClockInPressed;

  const ClockInBanner({
    super.key,
    required this.attendanceScreenCubit,
    required this.attendanceScreenState,
    required this.onClockInPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 316,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          HeaderBanner(
            title: "Let’s Clock-In!".tr(),
            subtitle: "Don’t miss your clock in schedule".tr(),
            image: AppAssets.clockIn,
          ),

          Positioned(
            top: 100,
            left: 12,
            right: 12,
            child: SummaryCard(
              backgroundColor: context.colors.white,
              title: "Total Working Hour".tr(),
              subtitle: "Paid Period 1 Sept 2024 - 30 Sept 2024".tr(),
              items: [
                StateItemModel(
                  label: "today",
                  value: "${attendanceScreenState.todayWorkingHours} Hrs".tr(),
                  icon: Icon(
                    Iconsax.clock5,
                    color: context.colors.gray300,
                    size: 16,
                  ),
                ),
                StateItemModel(
                  label: "This Pay Period",
                  value: "${attendanceScreenState.payPeriodWorkingHours} Hrs"
                      .tr(),
                  icon: Icon(
                    Iconsax.clock5,
                    color: context.colors.gray300,
                    size: 16,
                  ),
                ),
              ],
              buttons: [
                CustomPrimaryButton.gradient(
                  buttonText: "Clock In Now".tr(),
                  onPressed: onClockInPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> buildAttendanceButtons({
  required AttendanceScreenState state,
  required VoidCallback onClockIn,
  required VoidCallback onClockOut,
  required VoidCallback onBreak,
}) {
  return [
    CustomPrimaryButton.gradient(
      buttonText: "Clock In Now".tr(),
      onPressed: onClockIn,
    ),
  ];

  return [
    CustomPrimaryButton.gradient(
      buttonText: "Clock Out".tr(),
      onPressed: onClockOut,
    ),
    const SizedBox(height: 12),
    CustomPrimaryButton.outlined(
      buttonText: "Break".tr(),
      onPressed: onBreak,
    ),
  ];
}
