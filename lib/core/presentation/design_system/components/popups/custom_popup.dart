import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinput/pinput.dart';
import '../../theme/color/app_constant_colors.dart';
import '../../theme/helper/theme_extention.dart';
import '../custom_input_field.dart';
import '../custom_primary_button.dart';

class CustomPopup extends StatelessWidget {

  final IconData? icon;
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
    this.icon,
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

  factory CustomPopup.singleActionPopup({
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

  factory CustomPopup.singleInputPopup({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required String inputLabel,
    required String inputHint,
    required ValueChanged<String> onInputChanged,
    TextEditingController? controller,
    String? initialValue,
    String? errorText,
    TextInputType keyboardType = TextInputType.text,
    Widget? prefixIcon,
    bool obscureText = false,
    Widget? suffixIcon,
    bool enabled = true,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _SingleInputContent(
        label: inputLabel,
        hint: inputHint,
        onChanged: onInputChanged,
        controller: controller,
        initialValue: initialValue,
        errorText: errorText,
        keyboardType: keyboardType,
        prefixIcon: prefixIcon,
        obscureText: obscureText,
        suffixIcon: suffixIcon,
        enabled: enabled,
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  factory CustomPopup.otpVerificationPopup({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required ValueChanged<String> onOtpChanged,
    required VoidCallback onResendOtp,
    TextEditingController? otpController,
    bool enabled = true,
    bool isResendEnabled = true,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _OtpInputContent(
        controller: otpController,
        enabled: enabled,
        onChanged: onOtpChanged,
        onResend: onResendOtp,
        isResendEnabled: isResendEnabled,
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  factory CustomPopup.passwordResetPopup({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required String passwordLabel,
    required String passwordHint,
    required ValueChanged<String> onPasswordChanged,
    String? passwordErrorText,
    required String confirmPasswordLabel,
    required String confirmPasswordHint,
    required ValueChanged<String> onConfirmPasswordChanged,
    String? confirmPasswordErrorText,
    bool enabled = true,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _PasswordResetContent(
        passwordLabel: passwordLabel,
        passwordHint: passwordHint,
        onPasswordChanged: onPasswordChanged,
        passwordErrorText: passwordErrorText,
        confirmPasswordLabel: confirmPasswordLabel,
        confirmPasswordHint: confirmPasswordHint,
        onConfirmPasswordChanged: onConfirmPasswordChanged,
        confirmPasswordErrorText: confirmPasswordErrorText,
        enabled: enabled,
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      isPrimaryButtonLoading: isPrimaryButtonLoading,
      isPrimaryButtonEnabled: isPrimaryButtonEnabled,
    );
  }

  factory CustomPopup.loginPopup({
    IconData? icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required String identifierLabel,
    required String identifierHint,
    required ValueChanged<String> onIdentifierChanged,
    String? identifierErrorText,
    TextInputType identifierKeyboardType = TextInputType.emailAddress,
    Widget? identifierPrefixIcon,
    required String passwordLabel,
    required String passwordHint,
    required ValueChanged<String> onPasswordChanged,
    String? passwordErrorText,
    String? forgotPasswordText,
    VoidCallback? onForgotPasswordTap,
    String? signUpText,
    VoidCallback? onSignUpTap,
    bool enabled = true,
    bool isPrimaryButtonLoading = false,
    bool isPrimaryButtonEnabled = true,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _LoginContent(
        identifierLabel: identifierLabel,
        identifierHint: identifierHint,
        onIdentifierChanged: onIdentifierChanged,
        identifierErrorText: identifierErrorText,
        identifierKeyboardType: identifierKeyboardType,
        identifierPrefixIcon: identifierPrefixIcon,
        passwordLabel: passwordLabel,
        passwordHint: passwordHint,
        onPasswordChanged: onPasswordChanged,
        passwordErrorText: passwordErrorText,
        forgotPasswordText: forgotPasswordText,
        onForgotPasswordTap: onForgotPasswordTap,
        signUpText: signUpText,
        onSignUpTap: onSignUpTap,
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
    final double topPadding = icon != null ? 60 : 24;
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(24, topPadding, 24, 24),
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.textTheme.popupTitleFont.copyWith(
                    color: context.colors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                Text(
                  description,
                  style: context.textTheme.popupBodyFont.copyWith(
                    color: context.colors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 24),

                if (content != null) ...[
                  content!,
                  const SizedBox(height: 24),
                ],

                _buildPrimaryButton(context),

                if (secondaryButtonText != null) ...[
                  const SizedBox(height: 12),
                  _buildSecondaryButton(context),
                ],

                if (showFooter) ...[
                  const SizedBox(height: 16),
                  _buildFooter(context),
                ],
              ],
            ),
          ),
        ),
        if (icon != null)
        Positioned(
          top: -50,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppConstantColors.purple500,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppConstantColors.purple500.withOpacity(0.4),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return CustomPrimaryButton.gradient(
      height: 52,
      textStyle: context.textTheme.labelLargeFont.copyWith(
        color: context.colors.white,
      ),
      buttonText: primaryButtonText,
      borderRadius: 100,
      isLoading: isPrimaryButtonLoading,
      isEnabled: isPrimaryButtonEnabled,
      onPressed: primaryButtonOnPressed,
    );
  }

  Widget _buildSecondaryButton(BuildContext context) {
    return CustomPrimaryButton.outlined(
      height: 52,
      textStyle: context.textTheme.labelLargeFont.copyWith(
        color: context.colors.purple600,
      ),
      buttonText: secondaryButtonText!,
      borderColor: context.colors.purple600,
      borderRadius: 100,
      onPressed: secondaryButtonOnPressed,
    );
  }

  Widget _buildFooter(BuildContext context) {
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
                " ${"here".tr()}",
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
}

class _SingleInputContent extends StatefulWidget {
  const _SingleInputContent({
    required this.label,
    required this.hint,
    required this.onChanged,
    this.controller,
    this.initialValue,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.enabled = true,
  });

  final String label;
  final String hint;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final String? errorText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool enabled;

  @override
  State<_SingleInputContent> createState() => _SingleInputContentState();
}

class _SingleInputContentState extends State<_SingleInputContent> {
  late TextEditingController _controller;
  bool _isInternalController = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = TextEditingController(text: widget.initialValue ?? '');
      _isInternalController = true;
    }
  }

  @override
  void dispose() {
    if (_isInternalController) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 8),

        CustomInputField(
          controller: _controller,
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          isObscureText: widget.obscureText,
          onChanged: widget.onChanged,
          borderColor: widget.errorText != null
              ? context.colors.error
              : context.colors.gray300,
          filledColor: context.colors.white,
          hintKey: widget.hint,
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray300,
          radius: 12,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 16,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),

        if (widget.errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            widget.errorText!,
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
    required this.onResend,
    this.controller,
    this.enabled = true,
    this.isResendEnabled = true,
  });

  final TextEditingController? controller;
  final bool enabled;
  final ValueChanged<String> onChanged;
  final VoidCallback onResend;
  final bool isResendEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Pinput(
          length: 6,
          controller: controller,
          enabled: enabled,
          onChanged: onChanged,
          defaultPinTheme: PinTheme(
            width: 48,
            height: 48,
            textStyle: context.textTheme.headLineMediumFont.copyWith(
              color: context.colors.textPrimary,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: context.colors.gray300, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: 48,
            height: 48,
            textStyle: context.textTheme.headLineMediumFont.copyWith(
              color: context.colors.textPrimary,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppConstantColors.purple500, width: 2),
              borderRadius: BorderRadius.circular(12),
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

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Haven't received the verification code? ",
              style: context.textTheme.bodySmallFont.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            GestureDetector(
              onTap: isResendEnabled ? onResend : null,
              child: Text(
                "Resend it.",
                style: context.textTheme.labelMediumFont.copyWith(
                  color: isResendEnabled
                      ? AppConstantColors.purple500
                      : context.colors.gray400,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PasswordResetContent extends StatefulWidget {
  const _PasswordResetContent({
    required this.passwordLabel,
    required this.passwordHint,
    required this.onPasswordChanged,
    this.passwordErrorText,
    required this.confirmPasswordLabel,
    required this.confirmPasswordHint,
    required this.onConfirmPasswordChanged,
    this.confirmPasswordErrorText,
    this.enabled = true,
  });

  final String passwordLabel;
  final String passwordHint;
  final ValueChanged<String> onPasswordChanged;
  final String? passwordErrorText;
  final String confirmPasswordLabel;
  final String confirmPasswordHint;
  final ValueChanged<String> onConfirmPasswordChanged;
  final String? confirmPasswordErrorText;
  final bool enabled;

  @override
  State<_PasswordResetContent> createState() => _PasswordResetContentState();
}

class _PasswordResetContentState extends State<_PasswordResetContent> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPasswordField(
          context,
          label: widget.passwordLabel,
          hint: widget.passwordHint,
          onChanged: widget.onPasswordChanged,
          errorText: widget.passwordErrorText,
          obscure: _obscurePassword,
          onToggleObscure: () {
            setState(() => _obscurePassword = !_obscurePassword);
          },
        ),
        const SizedBox(height: 16),

        _buildPasswordField(
          context,
          label: widget.confirmPasswordLabel,
          hint: widget.confirmPasswordHint,
          onChanged: widget.onConfirmPasswordChanged,
          errorText: widget.confirmPasswordErrorText,
          obscure: _obscureConfirmPassword,
          onToggleObscure: () {
            setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
          },
        ),
      ],
    );
  }

  Widget _buildPasswordField(
      BuildContext context, {
        required String label,
        required String hint,
        required ValueChanged<String> onChanged,
        String? errorText,
        required bool obscure,
        required VoidCallback onToggleObscure,
      }) {
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
        const SizedBox(height: 8),
        CustomInputField(
          enabled: widget.enabled,
          isObscureText: obscure,
          onChanged: onChanged,
          borderColor: errorText != null
              ? context.colors.error
              : context.colors.gray300,
          filledColor: context.colors.white,
          hintKey: hint,
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray300,
          radius: 12,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 16,
          prefixIcon: Icon(
            Iconsax.lock,
            color: context.colors.purple400,
            size: 20,
          ),
          suffixIcon: IconButton(
            onPressed: onToggleObscure,
            icon: Icon(
              obscure ? Iconsax.eye_slash : Iconsax.eye,
              color: context.colors.gray400,
              size: 20,
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            errorText,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }
}

class _LoginContent extends StatefulWidget {
  const _LoginContent({
    required this.identifierLabel,
    required this.identifierHint,
    required this.onIdentifierChanged,
    this.identifierErrorText,
    this.identifierKeyboardType = TextInputType.emailAddress,
    this.identifierPrefixIcon,
    required this.passwordLabel,
    required this.passwordHint,
    required this.onPasswordChanged,
    this.passwordErrorText,
    this.forgotPasswordText,
    this.onForgotPasswordTap,
    this.signUpText,
    this.onSignUpTap,
    this.enabled = true,
  });

  final String identifierLabel;
  final String identifierHint;
  final ValueChanged<String> onIdentifierChanged;
  final String? identifierErrorText;
  final TextInputType identifierKeyboardType;
  final Widget? identifierPrefixIcon;
  final String passwordLabel;
  final String passwordHint;
  final ValueChanged<String> onPasswordChanged;
  final String? passwordErrorText;
  final String? forgotPasswordText;
  final VoidCallback? onForgotPasswordTap;
  final String? signUpText;
  final VoidCallback? onSignUpTap;
  final bool enabled;

  @override
  State<_LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<_LoginContent> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.identifierLabel,
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 8),
        CustomInputField(
          enabled: widget.enabled,
          keyboardType: widget.identifierKeyboardType,
          onChanged: widget.onIdentifierChanged,
          borderColor: widget.identifierErrorText != null
              ? context.colors.error
              : context.colors.gray300,
          filledColor: context.colors.white,
          hintKey: widget.identifierHint,
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray300,
          radius: 12,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 16,
          prefixIcon: widget.identifierPrefixIcon ??
              Icon(
                Iconsax.sms,
                color: context.colors.purple400,
                size: 20,
              ),
        ),
        if (widget.identifierErrorText != null) ...[
          const SizedBox(height: 8),
          Text(
            widget.identifierErrorText!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
        const SizedBox(height: 16),

        Text(
          widget.passwordLabel,
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 8),
        CustomInputField(
          enabled: widget.enabled,
          isObscureText: _obscurePassword,
          onChanged: widget.onPasswordChanged,
          borderColor: widget.passwordErrorText != null
              ? context.colors.error
              : context.colors.gray300,
          filledColor: context.colors.white,
          hintKey: widget.passwordHint,
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray300,
          radius: 12,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 16,
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
          const SizedBox(height: 8),
          Text(
            widget.passwordErrorText!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],

        if (widget.forgotPasswordText != null) ...[
          const SizedBox(height: 12),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: GestureDetector(
              onTap: widget.enabled ? widget.onForgotPasswordTap : null,
              child: Text(
                widget.forgotPasswordText!,
                style: context.textTheme.bodySmallFont.copyWith(
                  color: context.colors.purple600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}