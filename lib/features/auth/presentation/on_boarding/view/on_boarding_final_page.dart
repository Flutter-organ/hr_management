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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            width: double.infinity,
            child: Image.asset(
              AppAssets.kOnBoargingFinal,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "onboarding_final_title".tr(),
                    textAlign: TextAlign.center,
                    style: context.textTheme.headLineSmallFont.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "onboarding_final_subtitle".tr(),
                    textAlign: TextAlign.center,
                    style: context.textTheme.popupBodyFont.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 35),
                  CustomPrimaryButton.gradient(
                    buttonText: "sign_in".tr(),
                    textStyle: context.textTheme.labelLargeFont,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  CustomPrimaryButton.outlined(
                    buttonText: "sign_up".tr(),
                    textStyle: context.textTheme.labelLargeFont.copyWith(
                      color: ExtensionColors.kButtonBackgroundPrimary,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
