import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_management/core/presentation/design_system/components/custom_status_bar.dart';
import 'package:hr_management/core/presentation/design_system/components/empty_state_card.dart';
import 'package:hr_management/core/presentation/design_system/components/header_banner.dart';
import 'package:hr_management/core/presentation/design_system/components/property_good_poor.dart';
import 'package:hr_management/core/presentation/design_system/components/summary_card.dart';
import 'package:hr_management/core/presentation/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/presentation/design_system/theme/helper/extention_colors.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF1F3F8),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ExtensionColors.kButtonBackgroundPrimary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                ),
                HeaderBanner(
                  title: "challenges_awaiting".tr(),
                  subtitle: "let_tackle_your_todo_list".tr(),
                  image: AppAssets.kTaskScreenBanner,
                  paddingRight: 24,
                ),
                Positioned(
                  bottom: -75,
                  left: 0,
                  right: 0,

                  child: SummaryCard(
                    cardMargin: EdgeInsets.symmetric(horizontal: 12),
                    title: "summary_of_your_work".tr(),
                    items: [
                      StateItemModel(
                        label: "todo".tr(),
                        value: "0",
                        icon: SvgPicture.asset(AppAssets.todo),
                      ),
                      StateItemModel(
                        label: "in_progress".tr(),
                        value: "0",
                        icon: SvgPicture.asset(AppAssets.inProgress),
                      ),
                      StateItemModel(
                        label: "done".tr(),
                        value: "0",
                        icon: SvgPicture.asset(AppAssets.done),
                      ),
                    ],
                    subtitle: "your_current_task_progress".tr(),
                  ),
                ),
              ],
            ),

            SizedBox(height: 95),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  PropertyGoodPoor(status: BurnoutStatus.good),
                  SizedBox(height: 15),
                  CustomStatusBar(
                    reviewCount: 1,
                    approveCount: 1,
                    rejectedCount: 1,
                  ),

                  SizedBox(height: 10),
                  EmptyStateCard(
                    imgPath: AppAssets.noTasksAssigned,
                    imgtitle: "no_tasks_assigned".tr(),
                    imgDescription: "no_tasks_assigned_description".tr(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
