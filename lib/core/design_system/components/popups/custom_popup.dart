import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/theme/color/app_constant_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                "terms_and_conditions_title".tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.titleLargeFontSemiBold.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppConstantColors.black,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xffF9FAFB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Scrollbar(
                    thickness: 6.0,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: Text(
                        "terms_and_conditions_desc".tr(),

                        style: context.textTheme.labelMediumFont.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomPrimaryButton(
                buttonText: "i_agree".tr(),
                buttonType: ButtonType.gradient,
                height: 52,
                borderRadius: 30,
                textStyle: context.textTheme.labelLargeFont,
                gradient: const LinearGradient(
                  colors: [
                    AppConstantColors.purple500,
                    AppConstantColors.purple800,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              const SizedBox(height: 20),
              CustomPrimaryButton(
                buttonText: "decline".tr(),
                buttonType: ButtonType.outlined,
                height: 52,
                borderRadius: 30,
                borderColor: AppConstantColors.purple900,
                foregroundColor: AppConstantColors.purple900,
                textStyle: context.textTheme.labelLargeFont,
                onPressed: () {},
              ),
              SizedBox(height: 10),
            ],
          ),
    );
  }
}
