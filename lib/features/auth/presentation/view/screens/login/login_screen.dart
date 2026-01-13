import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/design_system/components/custom_input_field.dart';
import '../../../../../../core/design_system/components/custom_primary_button.dart';
import '../../../../../../core/design_system/theme/helper/extention_colors.dart';
import '../../../../../../core/design_system/theme/helper/theme_extention.dart';
import '../forget_Password/forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              // ══════════════════════════════════════════════════════════
              // HEADER
              // ══════════════════════════════════════════════════════════
              Center(
                child: Column(
                  children: [
                    // App Logo Placeholder
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: context.colors.purple500,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Iconsax.building_4,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'welcome_back'.tr(),
                      style: context.textTheme.headLineSmallFont.copyWith(
                        color: context.colors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'sign_in_to_continue'.tr(),
                      style: context.textTheme.bodyMediumFont.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // ══════════════════════════════════════════════════════════
              // EMAIL FIELD
              // ══════════════════════════════════════════════════════════
              Text(
                'email'.tr(),
                style: context.textTheme.bodySmallFont.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colors.gray600,
                ),
              ),
              const SizedBox(height: 8),
              CustomInputField(
                controller: _emailController,
                hintKey: 'enter_your_email'.tr(),
                keyboardType: TextInputType.emailAddress,
                borderColor: context.colors.gray300,
                enabledColor: context.colors.gray300,
                filledColor: context.colors.white,
                labelHintStyle: context.colors.gray400,
                radius: 12,
                contentPaddingHorizontal: 16,
                contentPaddingVertical: 16,
                prefixIcon: Icon(
                  Iconsax.sms,
                  color: context.colors.purple400,
                  size: 20,
                ),
              ),
              const SizedBox(height: 20),

              // ══════════════════════════════════════════════════════════
              // PASSWORD FIELD
              // ══════════════════════════════════════════════════════════
              Text(
                'password'.tr(),
                style: context.textTheme.bodySmallFont.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colors.gray600,
                ),
              ),
              const SizedBox(height: 8),
              CustomInputField(
                controller: _passwordController,
                hintKey: 'enter_your_password'.tr(),
                isObscureText: _obscurePassword,
                borderColor: context.colors.gray300,
                enabledColor: context.colors.gray300,
                filledColor: context.colors.white,
                labelHintStyle: context.colors.gray400,
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
              const SizedBox(height: 12),

              // ══════════════════════════════════════════════════════════
              // FORGOT PASSWORD BUTTON ← THIS IS THE KEY PART!
              // ══════════════════════════════════════════════════════════
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    // 👇 THIS TRIGGERS YOUR FORGOT PASSWORD FLOW!
                    ForgotPasswordPopup.show(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'forgot_password'.tr(),
                    style: context.textTheme.bodySmallFont.copyWith(
                      color: context.colors.purple600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // ══════════════════════════════════════════════════════════
              // LOGIN BUTTON (Dummy - just shows a snackbar)
              // ══════════════════════════════════════════════════════════
              CustomPrimaryButton.gradient(
                buttonText: 'sign_in'.tr(),
                height: 52,
                borderRadius: 100,
                gradient: LinearGradient(
                  colors: [
                    ExtensionColors.purpleGradient0,
                    ExtensionColors.purpleGradient1,
                    ExtensionColors.purpleGradient2,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                textStyle: context.textTheme.labelLargeFont.copyWith(
                  color: context.colors.white,
                  fontWeight: FontWeight.w600,
                ),
                onPressed: () {
                  // Dummy action - to be implemented by your teammate
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Login not implemented yet'),
                      backgroundColor: context.colors.gray600,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // ══════════════════════════════════════════════════════════
              // DIVIDER
              // ══════════════════════════════════════════════════════════
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: context.colors.gray200,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or'.tr(),
                      style: context.textTheme.bodySmallFont.copyWith(
                        color: context.colors.gray400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: context.colors.gray200,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // ══════════════════════════════════════════════════════════
              // SIGN UP LINK
              // ══════════════════════════════════════════════════════════
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'dont_have_account'.tr(),
                        style: context.textTheme.bodySmallFont.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      const TextSpan(text: ' '),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: GestureDetector(
                          onTap: () {
                            // Dummy action
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Sign Up not implemented yet'),
                                backgroundColor: context.colors.gray600,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          child: Text(
                            'sign_up'.tr(),
                            style: context.textTheme.bodySmallFont.copyWith(
                              color: context.colors.purple600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}