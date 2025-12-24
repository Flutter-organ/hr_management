import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';

class CustomAttendantHistory extends StatelessWidget {
  final String? attendanceDate, clockInOut, totalHours;
  const CustomAttendantHistory({
    super.key,
    this.attendanceDate,
    this.clockInOut,
    this.totalHours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        children: [
          Row(
            spacing: 4,
            children: [
              Icon(
                Iconsax.calendar_2,
                size: 16,
                color: context.colors.purple500,
              ),
              Text(
                attendanceDate ?? "attendancedate".tr(),
                style: context.textTheme.bodyLargeFont.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: context.colors.gray200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "totalhours".tr(),
                      style: context.textTheme.titleMediumFont,
                    ),
                    Text(
                      totalHours ?? "defaulttotalhours".tr(),
                      style: context.textTheme.bodyLargeFont.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "clockinout".tr(),
                      style: context.textTheme.titleMediumFont,
                    ),
                    Text(
                      clockInOut ?? "defaulttimerange".tr(),
                      style: context.textTheme.bodyLargeFont.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
