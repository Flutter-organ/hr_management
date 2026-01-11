import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/design_system/components/custom_input_field.dart';
import '../../../../../core/design_system/theme/helper/theme_extention.dart';

class ResetPasswordContent extends StatefulWidget {
  const ResetPasswordContent({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.enabled,
    this.passwordError,
    this.confirmPasswordError,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool enabled;
  final String? passwordError;
  final String? confirmPasswordError;

  @override
  State<ResetPasswordContent> createState() => _ResetPasswordContentState();
}

class _ResetPasswordContentState extends State<ResetPasswordContent> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'password'.tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 4),
        CustomInputField(
          controller: widget.passwordController,
          enabled: widget.enabled,
          isObscureText: _obscurePassword,
          borderColor: widget.passwordError != null
              ? context.colors.error
              : context.colors.gray400,
          filledColor: context.colors.white,
          hintKey: 'input_password'.tr(),
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray400,
          radius: 8,
          contentPaddingHorizontal: 12,
          contentPaddingVertical: 14,
          prefixIcon: Icon(
            Iconsax.lock,
            color: context.colors.purple400,
            size: 20,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() => _obscurePassword = !_obscurePassword);
            },
            icon: Icon(
              _obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
              color: context.colors.gray400,
              size: 20,
            ),
          ),
        ),
        if (widget.passwordError != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.passwordError!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
        const SizedBox(height: 16),

        Text(
          'confirm_password'.tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 4),
        CustomInputField(
          controller: widget.confirmPasswordController,
          enabled: widget.enabled,
          isObscureText: _obscureConfirmPassword,
          borderColor: widget.confirmPasswordError != null
              ? context.colors.error
              : context.colors.gray400,
          filledColor: context.colors.white,
          hintKey: 're_enter_password'.tr(),
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray400,
          radius: 8,
          contentPaddingHorizontal: 12,
          contentPaddingVertical: 14,
          prefixIcon: Icon(
            Iconsax.lock,
            color: context.colors.purple400,
            size: 20,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
            },
            icon: Icon(
              _obscureConfirmPassword ? Iconsax.eye_slash : Iconsax.eye,
              color: context.colors.gray400,
              size: 20,
            ),
          ),
        ),
        if (widget.confirmPasswordError != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.confirmPasswordError!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }
}