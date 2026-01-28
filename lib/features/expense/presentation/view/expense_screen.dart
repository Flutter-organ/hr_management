import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double designWidth = 390;
    double designHeight = 844;
    return Scaffold(
      backgroundColor: context.colors.gray200,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50 / designHeight * height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16 / designWidth * width),
          child: CustomPrimaryButton.gradient(
            buttonText: "submit_expense".tr(),
            onPressed: () {},
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            HeaderBanner(
              title: "expense_summary".tr(),
              subtitle: "claim_your_expenses_here".tr(),
              image: AppAssets.expenseBannerImage,
            ),

            Padding(
              padding:  EdgeInsets.fromLTRB(
               12 / designWidth * width,
               150 / designHeight * height,
               12 / designWidth * width,
               90 / designHeight * height,
               ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SummaryCard(
                      title: "total_expense".tr(),
                      subtitle: "period_1_jan_2024_30_dec_2024".tr(),
                      items: [
                        StateItemModel(
                          label: "total".tr(),
                          value: "\$0",
                          icon: SvgPicture.asset(AppAssets.cardPosIc),
                        ),
                        StateItemModel(
                          label: "review".tr(),
                          value: "\$0",
                          icon: SvgPicture.asset(AppAssets.reviewIc),
                        ),
                        StateItemModel(
                          label:  "approved".tr(),
                          value: "\$0",
                          icon: SvgPicture.asset(AppAssets.approvedIc),
                        ),
                      ],
                    ),

                     SizedBox(height: 16 / designHeight * height),

                    const CustomStatusBar(
                      reviewCount: 0,
                      approveCount: 0,
                      rejectedCount: 0,
                    ),

                     SizedBox(height: 16 / designHeight * height),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          CardHeader(
                            title: "expense".tr(),
                            subtitle: "expense_submitted".tr(),
                          ),
                           SizedBox(height: 24 / designHeight * height),
                          EmptyStateCard(
                            imgPath: AppAssets.emptyExpense,
                            imgtitle: "no_expense_submitted".tr(),
                            imgDescription:
"it_looks_like_you_dont_have_any_expense_submitted_dont_worry_this_space_will_be_updated_as_new_expense_submitted": "It looks like you don't have any expense submitted. Don't worry, this space will be updated as new expense submitted.".tr(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
