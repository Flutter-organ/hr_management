import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/design_system/components/custom_input_field.dart';
import '../../../../../core/design_system/theme/helper/theme_extention.dart';

class ForgotPasswordEmailContent extends StatelessWidget {
  const ForgotPasswordEmailContent({
    super.key,
    required this.controller,
    required this.enabled,
    this.errorText,
  });

  final TextEditingController controller;
  final bool enabled;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'email'.tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 4),
        CustomInputField(
          controller: controller,
          enabled: enabled,
          borderColor: errorText != null
              ? context.colors.error
              : context.colors.gray400,
          filledColor: context.colors.white,
          hintKey: 'enter_your_email'.tr(),
          keyboardType: TextInputType.emailAddress,
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray400,
          radius: 8,
          contentPaddingHorizontal: 12,
          contentPaddingVertical: 14,
          prefixIcon: Icon(
            Iconsax.sms,
            color: context.colors.purple400,
            size: 20,
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }
}