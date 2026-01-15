import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/core/design_system/theme/helper/snackbar_helper.dart';
import 'package:hr_management/features/auth/presentation/view/popups/password_reset_success_popup.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/design_system/components/popups/custom_popup.dart';
import '../../../../../core/di/injection_container.dart';
import '../../logic/reset_password/reset_password_cubit.dart';
import '../../logic/reset_password/reset_password_state.dart';
import '../../../../../core/design_system/theme/helper/popup_helper.dart';

class ResetPasswordPopup extends StatelessWidget {
  const ResetPasswordPopup._({
    required this.identifier,
    required this.otp,
  });

  final String identifier;
  final String otp;

  static Future<void> show(
      BuildContext context, {
        required String identifier,
        required String otp,
      }) {
    return PopupHelper.show(
      isDismissible: false,
      enableDrag: false,
      context: context,
      popup: BlocProvider(
        create: (_) => sl<ResetPasswordCubit>()
          ..setIdentifier(identifier)
          ..onOtpChanged(otp),
        child: ResetPasswordPopup._(
          identifier: identifier,
          otp: otp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.of(context).pop();
          PasswordResetSuccessPopup.show(context);
        }

        if (state.apiError != null) {
          SnackBarHelper.showError(context, state.apiError!);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ResetPasswordCubit>();

        return CustomPopup.passwordResetPopup(
          icon: Iconsax.security_safe4,
          title: 'Set a New Password',
          description: 'Please set a new password to secure your Work Mate account.',
          passwordLabel: 'Password',
          passwordHint: 'Input Password',
          onPasswordChanged: cubit.onPasswordChanged,
          passwordErrorText: state.passwordError,
          confirmPasswordLabel: 'Confirm Password',
          confirmPasswordHint: 'Re Enter Your Password',
          onConfirmPasswordChanged: cubit.onConfirmPasswordChanged,
          confirmPasswordErrorText: state.confirmPasswordError,
          enabled: !state.isLoading,
          primaryButtonText: 'Submit',
          isPrimaryButtonLoading: state.isLoading,
          isPrimaryButtonEnabled: !state.isLoading,
          primaryButtonOnPressed: () {
            //cubit.onOtpChanged(otp); // Set OTP before submit
            cubit.submit();
          },
        );
      },
    );
  }
}