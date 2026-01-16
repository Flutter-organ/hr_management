import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/core/design_system/theme/helper/snackbar_helper.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:hr_management/core/di/injection_container.dart';
import 'package:hr_management/features/auth/domain/enitites/login_type.dart';
import 'package:hr_management/features/auth/presentation/logic/forget_password/forgot_password_cubit.dart';
import 'package:hr_management/features/auth/presentation/logic/forget_password/forgot_password_state.dart';
import 'package:hr_management/features/auth/presentation/view/popups/verify_otp_popup.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/design_system/components/popups/custom_popup.dart';
import '../../../../../core/design_system/theme/helper/popup_helper.dart';

class ForgotPasswordPopup extends StatelessWidget {
  const ForgotPasswordPopup._();

  static Future<void> show(BuildContext context) {
    return PopupHelper.show(
      context: context,
      popup: BlocProvider(
        create: (_) => sl<ForgotPasswordCubit>(),
        child: const ForgotPasswordPopup._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) {
          return (current.isSuccess && !previous.isSuccess) ||
              (current.apiError != null &&
                  current.apiError != previous.apiError);
        },
      listener: (context, state) {
        if (state.isSuccess && state.successIdentifier != null) {
          Navigator.of(context).pop();
          VerifyOtpPopup.show(
            context,
            identifier: state.successIdentifier!,
            loginType: LoginType.email,
          );
        }

        if (state.apiError != null) {
          SnackBarHelper.showError(context, state.apiError!);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ForgotPasswordCubit>();

        return CustomPopup.singleInputPopup(
          icon: Iconsax.security_safe4,
          title: 'Forgot Password',
          description: 'Reset password code will be sent to your email to reset your password.',
          inputLabel: 'Email',
          inputHint: 'Enter your email',
          onInputChanged: cubit.onEmailChanged,
          errorText: state.emailError,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Iconsax.sms,
            color: context.colors.purple400,
            size: 20,
          ),
          enabled: !state.isLoading,
          primaryButtonText: 'Send Verification Code',
          isPrimaryButtonLoading: state.isLoading,
          isPrimaryButtonEnabled: !state.isLoading,
          primaryButtonOnPressed: cubit.submit,
        );
      },
    );
  }
}