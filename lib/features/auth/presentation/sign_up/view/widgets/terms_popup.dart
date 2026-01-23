import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';


class TermsPopup extends StatelessWidget {
  final VoidCallback onAgree;

  const TermsPopup({super.key, required this.onAgree});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisSize: .min,
          children: [
            const SizedBox(height: 16),
            Text(
              "terms_and_conditions_title".tr(),
              textAlign: TextAlign.center,
              style: context.textTheme.titleLargeFontSemiBold.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colors.black,
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
                  controller: scrollController,
                  thickness: 6.0,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: scrollController,
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
              borderRadius: 30,
              textStyle: context.textTheme.labelLargeFont,
              gradient: LinearGradient(
                colors: [context.colors.purple500, context.colors.purple800],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              onPressed: (){
                Navigator.of(context).pop();
                onAgree();
              }
            ),
            const SizedBox(height: 20),
            CustomPrimaryButton(
              buttonText: "decline".tr(),
              buttonType: ButtonType.outlined,
              height: 48,
              borderRadius: 30,
              borderColor: context.colors.purple900,
              foregroundColor: context.colors.purple900,
              textStyle: context.textTheme.labelLargeFont,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
