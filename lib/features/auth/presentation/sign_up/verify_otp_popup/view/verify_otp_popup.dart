import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/design_system/theme/helper/PopupHelper.dart';
import '../../../../../../core/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../welcome_to_work_mate_popup/logic/welcome_to_work_mate_popup_cubit.dart';
import '../../welcome_to_work_mate_popup/view/welcome_to_work_mate_popup.dart';
import '../logic/verify_otp_cubit.dart';
import '../logic/verify_otp_state.dart';

class VerifyOtpPopUp extends StatelessWidget {
  final String email;
  final String type;

  const VerifyOtpPopUp({super.key, required this.email, required this.type});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyOtpCubit>();

    return BlocConsumer<VerifyOtpCubit, VerifyOtpUiState>(
      listenWhen: (previous, current) {
        return previous.errorMessage != current.errorMessage ||
            previous.isVerified != current.isVerified;
      },
      listener: (context, state) {
        if (state.isVerified) {
          Navigator.of(context).pop();

          SnackBarHelper.showSuccess(context, 'verification_success'.tr());
          PopupHelper.show(
            context: context,
            popup: BlocProvider(
              create: (_) => sl<WelcomeToWorkMatePopupCubit>(),
              child: WelcomeToWorkMatePopUp(),
            ),
          );
          return;
        }

        if (state.errorMessage != null) {
          SnackBarHelper.showError(context,"failed_to_verify");
        }
      },
      builder: (context, state) {
        return CustomPopup.otpVerificationPopup(
          icon: Iconsax.sms_notification,
          title: 'verification_code_title'.tr(),
          description: 'verification_code_desc'.tr(args: [type.tr(), email]),
          primaryButtonText: 'submit'.tr(),
          primaryButtonOnPressed: () {
            cubit.verifyOtp(email: email, type: type);
          },
          onOtpChanged: (code) {
            cubit.setOtp(code);
          },
          onResendOtp: () {
            cubit.resendOtp();
          },
        );
      },
    );
  }
}
