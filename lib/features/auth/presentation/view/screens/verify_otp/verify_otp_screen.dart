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
import '../../helpers/auth_popup_helper.dart';
import '../reset_password/reset_password_screen.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  static Future<void> show(
      BuildContext context, {
        required String identifier,
        required LoginType loginType,
      }) async {
    await AuthPopupHelper.showAuthPopup(
      context: context,
      popup: BlocProvider(
        create: (_) => sl<ForgotPasswordCubit>(),
        child: _VerifyOtpPopup(
          identifier: identifier,
          loginType: loginType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _VerifyOtpPopup extends StatefulWidget {
  const _VerifyOtpPopup({
    required this.identifier,
    required this.loginType,
  });

  final String identifier;
  final LoginType loginType;

  @override
  State<_VerifyOtpPopup> createState() => _VerifyOtpPopupState();
}

class _VerifyOtpPopupState extends State<_VerifyOtpPopup> {
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

      ResetPasswordScreen.show(
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

        return CustomPopup.verificationPopup(
          icon: Iconsax.shield_tick,
          title: 'forgot_password'.tr(),
          description: 'otp_sent_description'.tr(args: [widget.identifier]),
          // content: _OtpContent(
          //   controller: _otpController,
          //   enabled: !isLoading,
          //   onChanged: (value) {
          //     setState(() => _isOtpComplete = value.length == 6);
          //   },
          onCompleted: (value) {setState(() => _isOtpComplete = true);},
          onTap: (){isLoading ? null : _onResendOtp;},
          primaryButtonText: 'submit'.tr(),
          // isPrimaryButtonLoading: isLoading,
          // isPrimaryButtonEnabled: _isOtpComplete && !isLoading,
          primaryButtonOnPressed: _onSubmit,
        );
      },
    );
  }
}

// class _OtpContent extends StatelessWidget {
//   const _OtpContent({
//     required this.controller,
//     required this.enabled,
//     required this.onChanged,
//     required this.onCompleted,
//     required this.onResend,
//   });
//
//   final TextEditingController controller;
//   final bool enabled;
//   final void Function(String) onChanged;
//   final void Function(String) onCompleted;
//   final VoidCallback? onResend;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // OTP Pinput
//         Center(
//           child: Pinput(
//             length: 6,
//             controller: controller,
//             enabled: enabled,
//             onChanged: onChanged,
//             onCompleted: onCompleted,
//             defaultPinTheme: PinTheme(
//               width: 45,
//               height: 45,
//               textStyle: context.textTheme.headLineMediumFont.copyWith(
//                 color: context.colors.textPrimary,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: context.colors.gray300,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             focusedPinTheme: PinTheme(
//               width: 45,
//               height: 45,
//               textStyle: context.textTheme.headLineMediumFont.copyWith(
//                 color: context.colors.textPrimary,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: AppConstantColors.purple500,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             keyboardType: TextInputType.number,
//             preFilledWidget: Text(
//               '0',
//               style: context.textTheme.headLineMediumFont.copyWith(
//                 color: context.colors.gray200,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//
//         // Resend row
//         Text.rich(
//           TextSpan(
//             children: [
//               TextSpan(
//                 text: "havent_received_code".tr(),
//                 style: context.textTheme.bodySmallFont.copyWith(
//                   color: context.colors.textPrimary,
//                 ),
//               ),
//               const TextSpan(text: ' '),
//               WidgetSpan(
//                 alignment: PlaceholderAlignment.middle,
//                 child: GestureDetector(
//                   onTap: onResend,
//                   child: Text(
//                     'resend_it'.tr(),
//                     style: context.textTheme.labelMediumFont.copyWith(
//                       color: onResend != null
//                           ? AppConstantColors.purple500
//                           : context.colors.gray400,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }