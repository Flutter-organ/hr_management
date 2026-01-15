import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/card_header.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/components/empty_state_card.dart';
import 'package:hr_management/core/design_system/components/horizontal_stacked_avatars.dart';
import 'package:hr_management/core/design_system/model/meeting_data_model.dart';
import 'package:hr_management/core/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';

class TodayMeeting extends StatelessWidget {
  final List<MeetingDataModel> meetings;
  const TodayMeeting({super.key, required this.meetings});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.colors.baseWhite,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        child: Column(
          children: [
            CardHeader(
              title: "today_meeting".tr(),
              subtitle: "meet_subtitle".tr(),
              count: meetings.isNotEmpty ? meetings.length.toString() : null,
            ),
            ...meetings.map((meeting) {
              return _buildMeetingDetails(context, meeting);
            }),
            if (meetings.isEmpty)
              EmptyStateCard(
                imgPath: AppAssets.noMeetings,
                imgtitle: "no_meetings".tr(),
                imgDescription: "no_meet_des".tr(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetingDetails(BuildContext context, MeetingDataModel meeting) {
    String meetingTime = meeting.formatTime(context);

    return Container(
      constraints: BoxConstraints(minHeight: 85),
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.gray100,
        border: Border.all(color: context.colors.gray200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: context.colors.purple500,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Iconsax.video5,
                        size: 12,
                        color: context.colors.pureWhite,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        meeting.meetingTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: context.textTheme.titleSmallFont.copyWith(
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Iconsax.clock5, color: context.colors.gray300, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    meetingTime,
                    style: context.textTheme.bodySmallFont.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                children: [
                  HorizontalStackedAvatars(commenterImage: meeting.userImages),
                  if (meeting.userImages.length > 3) ...{
                    const SizedBox(width: 4),
                    Text(
                      "+${meeting.userImages.length - 3}",
                      style: context.textTheme.bodySmallFont.copyWith(
                        color: context.colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  },
                ],
              ),
              CustomPrimaryButton.filled(
                width: 80,
                textStyle: context.textTheme.labelSmallFont.copyWith(
                  color: context.colors.white,
                ),
                buttonText: "join_meet".tr(),
                backgroundColor: context.colors.purple500,
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                borderRadius: 100,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
