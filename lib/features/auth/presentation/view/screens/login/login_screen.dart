import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../../logic/login/login_cubit.dart';
import '../../../logic/login/login_state.dart';
import '../../popups/forgot_password_popup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.19, 1.0],
            colors: [
              context.colors.purple500,
              context.colors.white,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 8.0,
                  sigmaY: 8.0,
                  tileMode: TileMode.decal,
                ),
                child: Image.asset(
                  AppAssets.registrationBackground,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BlocProvider(
                  create: (_) => sl<LoginCubit>(),
                  child: const _LoginCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginCard extends StatelessWidget {
  const _LoginCard();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
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