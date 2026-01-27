import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/presentation/design_system/components/card_header.dart';
import 'package:hr_management/core/presentation/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/presentation/design_system/components/custom_status_bar.dart';
import 'package:hr_management/core/presentation/design_system/components/empty_state_card.dart';
import 'package:hr_management/core/presentation/design_system/components/header_banner.dart';
import 'package:hr_management/core/presentation/design_system/components/summary_card.dart';
import 'package:hr_management/core/presentation/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/presentation/design_system/theme/helper/theme_extention.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray200,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: HeaderBanner(
              title: "Expenses Overview".tr(),
              subtitle: "Claim your expenses here.".tr(),
              image: AppAssets.expenseBannerImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 60),
            child: Column(
              children: [
                SizedBox(height: 150),
                SummaryCard(
                  title: "Total Expenses".tr(),
                  items: [
                    StateItemModel(label: "Total", value: "\$0"),
                    StateItemModel(label: "Reimbursed", value: "\$0"),
                    StateItemModel(label: "Pending", value: "\$0"),
                  ],
                ),
                SizedBox(height: 16),
                CustomStatusBar(
                  reviewCount: 0,
                  approveCount: 0,
                  rejectedCount: 0,
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      CardHeader(
                        title: "My Expenses".tr(),
                        subtitle: "You have no expenses yet.".tr(),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 150,
                        child: SingleChildScrollView(
                          child: EmptyStateCard(
                            imgPath: AppAssets.expenseBannerImage,
                            imgtitle: "No Expenses Found".tr(),
                            imgDescription:
                                "You haven't claimed any expenses yet. Start by adding a new expense."
                                    .tr(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 55,
                        width: double.infinity,
                        color: context.colors.white,
                        child: Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 24,
                            vertical: 14,
                          ),
                          child: CustomPrimaryButton.gradient(
                            buttonText: "Submit",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
