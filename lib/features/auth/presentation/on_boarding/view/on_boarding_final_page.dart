import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../core/presentation/routes/route_names.dart';


class OnBoardingFinalPage extends StatelessWidget {
  const OnBoardingFinalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Image.asset(AppAssets.kOnBoargingFinal, fit: BoxFit.cover),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        "onboarding_final_title".tr(),
                        textAlign: TextAlign.center,
                        style: context.textTheme.headLineSmallFont.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "onboarding_final_subtitle".tr(),
                        textAlign: TextAlign.center,
                        style: context.textTheme.popupBodyFont.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(34, 28, 34, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPrimaryButton.gradient(
                  buttonText: "sign_in".tr(),
                  textStyle: context.textTheme.labelLargeFont,
                  onPressed: () {
                    context.go(RouteNames.login);
                  },
                ),
                const SizedBox(height: 16),
                CustomPrimaryButton.outlined(
                  buttonText: "register".tr(),
                  textStyle: context.textTheme.labelLargeFont.copyWith(
                    color: ExtensionColors.kButtonBackgroundPrimary,
                  ),
                  onPressed: () {
                    context.go(RouteNames.register);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
