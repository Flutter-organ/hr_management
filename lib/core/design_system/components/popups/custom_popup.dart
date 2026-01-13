import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/theme/color/app_constant_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinput/pinput.dart';
import '../../theme/helper/extention_colors.dart';
import '../custom_input_field.dart';

class CustomPopup extends StatelessWidget {

  final IconData icon;
  final String title;
  final String description;
  final Widget? content;
  final String primaryButtonText;
  final VoidCallback primaryButtonOnPressed;
  final String? secondaryButtonText;
  final VoidCallback? secondaryButtonOnPressed;
  final VoidCallback? onTapHere;
  final bool showFooter;
  final bool isPrimaryButtonLoading;
  final bool isPrimaryButtonEnabled;

  const CustomPopup({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.content,
    required this.primaryButtonText,
    required this.primaryButtonOnPressed,
    this.secondaryButtonText,
    this.secondaryButtonOnPressed,
    this.onTapHere,
    this.showFooter = false,
    this.isPrimaryButtonLoading = false,
    this.isPrimaryButtonEnabled = true,
  });

  factory CustomPopup.primary({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    String? secondaryButtonText,
    VoidCallback? secondaryButtonOnPressed,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      secondaryButtonText: secondaryButtonText,
      secondaryButtonOnPressed: secondaryButtonOnPressed,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  factory CustomPopup.singleactionpopup({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  factory CustomPopup.inputfieldpopup({
    required IconData icon,
    required String title,
    required String description,
    required String labelInputTextField,
    required String hintInputTextField,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _InputFieldWithLabel(
        label: labelInputTextField,
        hint: hintInputTextField,
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  factory CustomPopup.verificationPopup({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required void Function(String) onCompleted,
    required VoidCallback onTapResend,
    TextEditingController? otpController,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
    bool isResendEnabled = true,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _VerificationContent(
        controller: otpController,
        onCompleted: onCompleted,
        onResend: onTapResend,
        isResendEnabled: isResendEnabled,
      ),
      showFooter: false,
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  factory CustomPopup.phoneAuthPopup({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required void Function(String) onCompleted,
    required VoidCallback onTapResend,
    required VoidCallback onTapHere,
    bool showFooter = true,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
  }) {
    return CustomPopup(
      showFooter: showFooter,
      icon: icon,
      title: title,
      description: description,
      content: _VerificationContent(
        onCompleted: onCompleted,
        onResend: onTapResend,
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      onTapHere: onTapHere,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  factory CustomPopup.ClockOut({
    required IconData icon,
    required String title,
    required String description,
    required String todayWorkHours,
    required String overTimeTodayWorkHours,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required String secondaryButtonText,
    required VoidCallback secondaryButtonOnPressed,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _ClockOutContent(
        todayWorkHours: todayWorkHours,
        overTimeTodayWorkHours: overTimeTodayWorkHours,
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      secondaryButtonText: secondaryButtonText,
      secondaryButtonOnPressed: secondaryButtonOnPressed,
    );
  }

  factory CustomPopup.forgotPasswordPopup({
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required TextEditingController emailController,
    String? emailLabel,
    String? emailHint,
    String? emailErrorText,
    bool enabled = true,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
    IconData icon = Iconsax.shield_tick,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _EmailInputContent(
        controller: emailController,
        label: emailLabel ?? 'email'.tr(),
        hint: emailHint ?? 'enter_your_email'.tr(),
        errorText: emailErrorText,
        enabled: enabled,
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  factory CustomPopup.otpVerificationPopup({
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required void Function(String) onOtpCompleted,
    required void Function(String) onOtpChanged,
    required VoidCallback onResendOtp,
    TextEditingController? otpController,
    bool enabled = true,
    bool isResendEnabled = true,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
    IconData icon = Iconsax.shield_tick,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _OtpInputContent(
        controller: otpController,
        enabled: enabled,
        onChanged: onOtpChanged,
        onCompleted: onOtpCompleted,
        onResend: onResendOtp,
        isResendEnabled: isResendEnabled,
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  factory CustomPopup.resetPasswordPopup({
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    String? passwordLabel,
    String? passwordHint,
    String? confirmPasswordLabel,
    String? confirmPasswordHint,
    String? passwordErrorText,
    String? confirmPasswordErrorText,
    bool enabled = true,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
    IconData icon = Iconsax.shield_tick,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _ResetPasswordContent(
        passwordController: passwordController,
        confirmPasswordController: confirmPasswordController,
        passwordLabel: passwordLabel ?? 'password'.tr(),
        passwordHint: passwordHint ?? 'input_password'.tr(),
        confirmPasswordLabel: confirmPasswordLabel ?? 'confirm_password'.tr(),
        confirmPasswordHint: confirmPasswordHint ?? 're_enter_password'.tr(),
        passwordErrorText: passwordErrorText,
        confirmPasswordErrorText: confirmPasswordErrorText,
        enabled: enabled,
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 82, 20, 20),
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(context, title),
              const SizedBox(height: 16),
              _buildDescription(context, description),
              const SizedBox(height: 16),
              if (content != null) ...[content!, const SizedBox(height: 16)],
              _buildPrimaryButton(
                context,
                primaryButtonText,
                primaryButtonOnPressed,
                isPrimaryButtonLoading,
                isPrimaryButtonEnabled,
              ),
              if (secondaryButtonText != null) ...[
                const SizedBox(height: 16),
                _buildSecondaryButton(
                  context,
                  secondaryButtonText!,
                  secondaryButtonOnPressed,
                ),
              ],
              if (showFooter) ...[
                const SizedBox(height: 16),
                _buildSignInAlternativeFooter(context, onTapHere),
              ],
            ],
          ),
        ),
        _buildTopIconCircle(icon),
      ],
    );
  }
}

Widget _buildTopIconCircle(IconData icon) {
  return Positioned(
    top: -50,
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppConstantColors.purple500,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppConstantColors.purple500.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: AppConstantColors.white, size: 40),
    ),
  );
}

Widget _buildTitle(BuildContext context, String title) {
  return Text(
    title,
    style: context.textTheme.popupTitleFont.copyWith(
      color: context.colors.textPrimary,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget _buildDescription(BuildContext context, String description) {
  return Text(
    description,
    style: context.textTheme.popupBodyFont.copyWith(
      color: context.colors.textSecondary,
    ),
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start,
  );
}

Widget _buildPrimaryButton(
    BuildContext context,
    String primaryButtonText,
    VoidCallback primaryButtonOnPressed,
    bool isLoading,
    bool isEnabled,
    ) {
  return CustomPrimaryButton.gradient(
    height: 48,
    textStyle: context.textTheme.labelLargeFont.copyWith(
      color: context.colors.white,
    ),
    gradient: LinearGradient(
      colors: [
        ExtensionColors.purpleGradient0,
        ExtensionColors.purpleGradient1,
        ExtensionColors.purpleGradient2,
      ],
    ),
    buttonText: primaryButtonText,
    borderRadius: 100,
    isLoading: isLoading,
    isEnabled: isEnabled,
    onPressed: primaryButtonOnPressed,
  );
}

Widget _buildSecondaryButton(
    BuildContext context,
    String secondaryButtonText,
    VoidCallback? secondaryButtonOnPressed,
    ) {
  return CustomPrimaryButton.outlined(
    height: 48,
    textStyle: context.textTheme.labelLargeFont.copyWith(
      color: context.colors.purple600,
    ),
    buttonText: secondaryButtonText,
    borderColor: context.colors.purple600,
    borderRadius: 100,
    onPressed: secondaryButtonOnPressed,
  );
}

Widget _buildSignInAlternativeFooter(
    BuildContext context,
    VoidCallback? onTapHere,
    ) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "sign_in_different_method".tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GestureDetector(
            onTap: onTapHere,
            child: Text(
              "here".tr(),
              style: context.textTheme.labelMediumFont.copyWith(
                color: AppConstantColors.purple500,
              ),
            ),
          ),
        ),
      ],
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

class _InputFieldWithLabel extends StatelessWidget {
  const _InputFieldWithLabel({
    required this.label,
    required this.hint,
  });

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 4),
        CustomInputField(
          borderColor: context.colors.gray400,
          filledColor: context.colors.white,
          hintKey: hint,
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray400,
          radius: 8,
          contentPaddingHorizontal: 12,
          contentPaddingVertical: 14,
          prefixIcon: Icon(Iconsax.sms, color: context.colors.purple400),
        ),
      ],
    );
  }
}

class _EmailInputContent extends StatelessWidget {
  const _EmailInputContent({
    required this.controller,
    required this.label,
    required this.hint,
    required this.enabled,
    this.errorText,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final String? errorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 4),
        CustomInputField(
          controller: controller,
          enabled: enabled,
          keyboardType: TextInputType.emailAddress,
          borderColor: errorText != null
              ? context.colors.error
              : context.colors.gray400,
          filledColor: context.colors.white,
          hintKey: hint,
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

class _OtpInputContent extends StatelessWidget {
  const _OtpInputContent({
    required this.onChanged,
    required this.onCompleted,
    required this.onResend,
    this.controller,
    this.enabled = true,
    this.isResendEnabled = true,
  });

  final TextEditingController? controller;
  final bool enabled;
  final void Function(String) onChanged;
  final void Function(String) onCompleted;
  final VoidCallback onResend;
  final bool isResendEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Pinput(
            length: 6,
            controller: controller,
            enabled: enabled,
            onChanged: onChanged,
            onCompleted: onCompleted,
            defaultPinTheme: PinTheme(
              width: 45,
              height: 45,
              textStyle: context.textTheme.headLineMediumFont.copyWith(
                color: context.colors.textPrimary,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: context.colors.gray300, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 45,
              height: 45,
              textStyle: context.textTheme.headLineMediumFont.copyWith(
                color: context.colors.textPrimary,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppConstantColors.purple500, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            keyboardType: TextInputType.number,
            preFilledWidget: Text(
              "0",
              style: context.textTheme.headLineMediumFont.copyWith(
                color: context.colors.gray200,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildResendRow(context),
      ],
    );
  }

  Widget _buildResendRow(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "havent_received_code".tr(),
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          const TextSpan(text: ' '),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: isResendEnabled ? onResend : null,
              child: Text(
                "resend_it".tr(),
                style: context.textTheme.labelMediumFont.copyWith(
                  color: isResendEnabled
                      ? AppConstantColors.purple500
                      : context.colors.gray400,
                ),
              ),
            ),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _VerificationContent extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String) onCompleted;
  final VoidCallback onResend;
  final bool isResendEnabled;

  const _VerificationContent({
    required this.onCompleted,
    required this.onResend,
    this.controller,
    this.isResendEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Pinput(
          length: 6,
          controller: controller,
          onCompleted: onCompleted,
          defaultPinTheme: PinTheme(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: context.colors.gray300, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          keyboardType: TextInputType.number,
          preFilledWidget: Text(
            "0",
            style: context.textTheme.headLineMediumFont.copyWith(
              color: context.colors.gray200,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildResendRow(context),
      ],
    );
  }

  Widget _buildResendRow(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Haven't_received_the_verification_code?".tr(),
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: isResendEnabled ? onResend : null,
              child: Text(
                "Resend_it".tr(),
                style: context.textTheme.labelMediumFont.copyWith(
                  color: isResendEnabled
                      ? AppConstantColors.purple500
                      : context.colors.gray400,
                ),
              ),
            ),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ResetPasswordContent extends StatefulWidget {
  const _ResetPasswordContent({
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordLabel,
    required this.passwordHint,
    required this.confirmPasswordLabel,
    required this.confirmPasswordHint,
    required this.enabled,
    this.passwordErrorText,
    this.confirmPasswordErrorText,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String passwordLabel;
  final String passwordHint;
  final String confirmPasswordLabel;
  final String confirmPasswordHint;
  final String? passwordErrorText;
  final String? confirmPasswordErrorText;
  final bool enabled;

  @override
  State<_ResetPasswordContent> createState() => _ResetPasswordContentState();
}

class _ResetPasswordContentState extends State<_ResetPasswordContent> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.passwordLabel,
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 4),
        CustomInputField(
          controller: widget.passwordController,
          enabled: widget.enabled,
          isObscureText: _obscurePassword,
          borderColor: widget.passwordErrorText != null
              ? context.colors.error
              : context.colors.gray400,
          filledColor: context.colors.white,
          hintKey: widget.passwordHint,
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
        if (widget.passwordErrorText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.passwordErrorText!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
        const SizedBox(height: 16),

        Text(
          widget.confirmPasswordLabel,
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
          borderColor: widget.confirmPasswordErrorText != null
              ? context.colors.error
              : context.colors.gray400,
          filledColor: context.colors.white,
          hintKey: widget.confirmPasswordHint,
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
        if (widget.confirmPasswordErrorText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.confirmPasswordErrorText!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }
}

class _ClockOutContent extends StatelessWidget {
  const _ClockOutContent({
    required this.todayWorkHours,
    required this.overTimeTodayWorkHours,
  });

  final String todayWorkHours;
  final String overTimeTodayWorkHours;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ClockOutItem(
            time: "today".tr(),
            hour: todayWorkHours,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _ClockOutItem(
            time: "overtime".tr(),
            hour: overTimeTodayWorkHours,
          ),
        ),
      ],
    );
  }
}

class _ClockOutItem extends StatelessWidget {
  const _ClockOutItem({
    required this.time,
    required this.hour,
  });

  final String time;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colors.gray50, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: context.textTheme.labelMediumFont.copyWith(
              color: context.colors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            hour,
            style: context.textTheme.titleLargeFont.copyWith(
              fontSize: 20,
              color: context.colors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}