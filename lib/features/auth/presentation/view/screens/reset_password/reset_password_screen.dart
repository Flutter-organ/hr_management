import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/features/auth/presentation/view/screens/reset_password/password_reset_success_screen.dart';
import 'package:hr_management/features/auth/presentation/widgets/reset_password_content.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../../logic/reset_password/ResetPasswordCubit.dart';
import '../../../logic/reset_password/reset_password_state.dart';
import '../../helpers/auth_popup_helper.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  static Future<void> show(
      BuildContext context, {
        required String identifier,
        required String otp,
      }) async {
    await AuthPopupHelper.showAuthPopup(
      context: context,
      popup: BlocProvider(
        create: (_) => sl<ResetPasswordCubit>(),
        child: _ResetPasswordPopup(
          identifier: identifier,
          otp: otp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _ResetPasswordPopup extends StatefulWidget {
  const _ResetPasswordPopup({
    required this.identifier,
    required this.otp,
  });

  final String identifier;
  final String otp;

  @override
  State<_ResetPasswordPopup> createState() => _ResetPasswordPopupState();
}

class _ResetPasswordPopupState extends State<_ResetPasswordPopup> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _validate() {
    bool isValid = true;

    if (_passwordController.text.isEmpty) {
      setState(() => _passwordError = 'password_required'.tr());
      isValid = false;
    } else if (_passwordController.text.length < 8) {
      setState(() => _passwordError = 'password_min_length'.tr());
      isValid = false;
    } else {
      setState(() => _passwordError = null);
    }

    if (_confirmPasswordController.text.isEmpty) {
      setState(() => _confirmPasswordError = 'confirm_password_required'.tr());
      isValid = false;
    } else if (_confirmPasswordController.text != _passwordController.text) {
      setState(() => _confirmPasswordError = 'passwords_do_not_match'.tr());
      isValid = false;
    } else {
      setState(() => _confirmPasswordError = null);
    }

    return isValid;
  }

  void _onSubmit() {
    if (_validate()) {
      context.read<ResetPasswordCubit>().resetPassword(
        identifier: widget.identifier,
        code: widget.otp,
        password: _passwordController.text,
        passwordConfirmation: _confirmPasswordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Navigator.of(context).pop();

          PasswordResetSuccessScreen.show(context);
        } else if (state is ResetPasswordError) {
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
        final isLoading = state is ResetPasswordLoading;

        return CustomPopup(
          icon: Iconsax.shield_tick,
          title: 'set_new_password'.tr(),
          description: 'set_new_password_description'.tr(),
          content: ResetPasswordContent(
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
            enabled: !isLoading,
            passwordError: _passwordError,
            confirmPasswordError: _confirmPasswordError,
          ),
          primaryButtonText: 'submit'.tr(),
          isPrimaryButtonLoading: isLoading,
          isPrimaryButtonEnabled: !isLoading,
          primaryButtonOnPressed: _onSubmit,
        );
      },
    );
  }
}