import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../../../domain/enitites/login_type.dart';
import '../../../logic/forget_password/forgot_password_cubit.dart';
import '../../../logic/forget_password/forgot_password_state.dart';
import '../../../widgets/forgot_password_content.dart';
import '../../helpers/auth_popup_helper.dart';
import '../verify_otp/verify_otp_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  static Future<void> show(BuildContext context) async {
    await AuthPopupHelper.showAuthPopup(
      context: context,
      popup: BlocProvider(
        create: (_) => sl<ForgotPasswordCubit>(),
        child: const _ForgotPasswordPopup(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This can be an empty scaffold that auto-shows the popup
    // Or you can just use the static show() method from other screens
    return const SizedBox.shrink();
  }
}

class _ForgotPasswordPopup extends StatefulWidget {
  const _ForgotPasswordPopup();

  @override
  State<_ForgotPasswordPopup> createState() => _ForgotPasswordPopupState();
}

class _ForgotPasswordPopupState extends State<_ForgotPasswordPopup> {
  final _emailController = TextEditingController();
  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _validateEmail() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() => _emailError = 'email_required'.tr());
      return false;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      setState(() => _emailError = 'invalid_email'.tr());
      return false;
    }

    setState(() => _emailError = null);
    return true;
  }

  void _onSendCode() {
    if (_validateEmail()) {
      context.read<ForgotPasswordCubit>().forgotPassword(
        identifier: _emailController.text.trim(),
        loginType: LoginType.email,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          // Close current popup
          Navigator.of(context).pop();

          // Show OTP verification popup
          VerifyOtpScreen.show(
            context,
            identifier: state.identifier,
            loginType: LoginType.email,
          );

        } else if (state is ForgotPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: context.colors.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is ForgotPasswordLoading;

        return CustomPopup(
          icon: Iconsax.shield_tick,
          title: 'forgot_password'.tr(),
          description: 'forgot_password_description'.tr(),
          content: ForgotPasswordEmailContent(
            controller: _emailController,
            enabled: !isLoading,
            errorText: _emailError,
          ),
          primaryButtonText: 'send_verification_code'.tr(),
          isPrimaryButtonLoading: isLoading,
          isPrimaryButtonEnabled: !isLoading,
          primaryButtonOnPressed: _onSendCode,
        );
      },
    );
  }
}