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
                  title: "Challenges Awaiting",
                  subtitle: "Let’s tackle your to do list",
                  image: AppAssets.kTaskScreenBanner,
                  paddingRight: 24,
                ),
                Positioned(
                  bottom: -75,
                  left: 0,
                  right: 0,

                  child: SummaryCard(
                    cardMargin: EdgeInsets.symmetric(horizontal: 12),
                    title: "Summary of your work",
                    items: [
                      StateItemModel(
                        label: "To Do",
                        value: "0",
                        icon: SvgPicture.asset(AppAssets.todo),
                      ),
                      StateItemModel(
                        label: "In Progress",
                        value: "0",
                        icon: SvgPicture.asset(AppAssets.inProgress),
                      ),
                      StateItemModel(
                        label: "Done",
                        value: "0",
                        icon: SvgPicture.asset(AppAssets.done),
                      ),
                    ],
                    subtitle: "Your current task progress",
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
                    imgtitle: "No Tasks Assigned",
                    imgDescription:
                        "It looks like you don’t have any tasks assigned to you right now. Don’t worry, this space will be updated as new tasks become available.",
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
