import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../../../domain/enitites/login_type.dart';
import '../../../logic/forget_password/forgot_password_cubit.dart';
import '../../../logic/forget_password/forgot_password_state.dart';
import '../reset_password/reset_password_screen.dart';

class VerifyOtpPopup extends StatefulWidget {
  const VerifyOtpPopup({
    super.key,
    required this.identifier,
    required this.loginType,
  });

  final String identifier;
  final LoginType loginType;

  static Future<void> show(
      BuildContext context, {
        required String identifier,
        required LoginType loginType,
      }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocProvider(
          create: (_) => sl<ForgotPasswordCubit>(),
          child: VerifyOtpPopup(
            identifier: identifier,
            loginType: loginType,
          ),
        ),
      ),
    );
  }

  @override
  State<VerifyOtpPopup> createState() => _VerifyOtpPopupState();
}

class _VerifyOtpPopupState extends State<VerifyOtpPopup> {
  final _otpController = TextEditingController();
  bool _isOtpComplete = false;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_isOtpComplete) {
      Navigator.of(context).pop();
      ResetPasswordPopup.show(
        context,
        identifier: widget.identifier,
        otp: _otpController.text,
      );
    }
  }

  void _onResendOtp() {
    context.read<ForgotPasswordCubit>().forgotPassword(
      identifier: widget.identifier,
      loginType: widget.loginType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('otp_resent_successfully'.tr()),
              backgroundColor: context.colors.success25,
              behavior: SnackBarBehavior.floating,
            ),
          );
          _otpController.clear();
          setState(() => _isOtpComplete = false);
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

        return CustomPopup.otpVerificationPopup(
          title: 'forgot_password'.tr(),
          description: 'otp_sent_description'.tr(args: [widget.identifier]),
          otpController: _otpController,
          enabled: !isLoading,
          onOtpChanged: (value) {
            setState(() => _isOtpComplete = value.length == 6);
          },
          onOtpCompleted: (value) {
            setState(() => _isOtpComplete = true);
          },
          onResendOtp: _onResendOtp,
          isResendEnabled: !isLoading,
          primaryButtonText: 'submit'.tr(),
          isPrimaryButtonLoading: isLoading,
          isPrimaryButtonEnabled: _isOtpComplete && !isLoading,
          primaryButtonOnPressed: _onSubmit,
        );
      },
    );
  }
}