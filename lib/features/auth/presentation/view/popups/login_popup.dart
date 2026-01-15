import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:hr_management/core/di/injection_container.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/design_system/components/popups/custom_popup.dart';
import '../../logic/login/login_cubit.dart';
import '../../logic/login/login_state.dart';
import '../../../../../core/design_system/theme/helper/popup_helper.dart';
import 'forgot_password_popup.dart';

class LoginPopup extends StatelessWidget {
  const LoginPopup._();

  static Future<void> show(BuildContext context) {
    return PopupHelper.show(
      context: context,
      isDismissible: false,
      enableDrag: false,
      popup: BlocProvider(
        create: (_) => sl<LoginCubit>(),
        child: const LoginPopup._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.of(context).pop();
          context.go('/home');
        }

        if (state.apiError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.apiError!),
              backgroundColor: context.colors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return CustomPopup.loginPopup(
          icon: Iconsax.user,
          title: 'Sign In',
          description: 'Sign in to your account to continue',
          identifierLabel: 'Email',
          identifierHint: 'Enter your email',
          onIdentifierChanged: cubit.onEmailChanged,
          identifierErrorText: state.emailError,
          passwordLabel: 'Password',
          passwordHint: 'Enter your password',
          onPasswordChanged: cubit.onPasswordChanged,
          passwordErrorText: state.passwordError,
          forgotPasswordText: 'Forgot Password?',
          onForgotPasswordTap: () {
            Navigator.of(context).pop();
            ForgotPasswordPopup.show(context);
          },
          enabled: !state.isLoading,
          primaryButtonText: 'Sign In',
          isPrimaryButtonLoading: state.isLoading,
          isPrimaryButtonEnabled: !state.isLoading,
          primaryButtonOnPressed: cubit.submit,
        );
      },
    );
  }
}