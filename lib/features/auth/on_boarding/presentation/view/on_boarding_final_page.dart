import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/design_system/theme/helper/extention_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

class OnBoardingFinalPage extends StatelessWidget {
  const OnBoardingFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Image.asset(AppAssets.kOnBoargingFinal, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34),
            child: Column(
              children: [
                Text(
                  "onboarding_final_title".tr(),
                  textAlign: TextAlign.center,
                  style: context.textTheme.headLineSmallFont.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "onboarding_final_subtitle".tr(),
                  textAlign: TextAlign.center,
                  style: context.textTheme.popupBodyFont.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                SizedBox(height: 35),
                Column(
                  children: [
                    CustomPrimaryButton.gradient(
                      buttonText: "sign_in".tr(),
                      textStyle: context.textTheme.labelLargeFont,
                      onPressed: () {},
                    ),
                    SizedBox(height: 16),
                    CustomPrimaryButton.outlined(
                      buttonText: "sign_up".tr(),
                      textStyle: context.textTheme.labelLargeFont.copyWith(
                        color: ExtensionColors.kButtonBackgroundPrimary,
                      ),
                      onPressed: () {},
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
