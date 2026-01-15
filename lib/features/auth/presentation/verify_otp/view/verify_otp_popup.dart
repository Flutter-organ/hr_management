import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/design_system/components/popups/custom_popup.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../domain/usecase/OtpUseCase.dart';
import '../../welcome_to_work_mate_popup/logic/welcome_to_work_mate_popup_cubit.dart';
import '../../welcome_to_work_mate_popup/view/welcome_to_work_mate_popup.dart';
import '../logic/verify_otp_cubit.dart';
import '../logic/verify_otp_state.dart';

class VerifyOtpPopUp extends StatelessWidget {
  final String email;
  final String type;

  const VerifyOtpPopUp({
    super.key,
    required this.email,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyOtpCubit>();

    return BlocListener<VerifyOtpCubit, VerifyOtpUiState>(
      listener: (context, state) {
        if (state.isVerified) {

          Navigator.of(context).pop();

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (_) {
              return BlocProvider(
                create: (_) => WelcomeToWorkMatePopupCubit(),
                child: const WelcomeToWorkMatePopUp(),
              );
            },
          );
        }
      },
      child: CustomPopup.otpVerificationPopup(
        icon: Iconsax.sms_notification,
        title: 'verification_code_title'.tr(),
        description: 'verification_code_desc'.tr(
          args: [
            type.tr(),
            email,
          ],
        ),
        primaryButtonText: 'submit'.tr(),
        primaryButtonOnPressed: () {
          cubit.verifyOtp(email: email, type: type);
        },
        onOtpChanged: (code) {
          cubit.setOtp(code);
        },
        onResendOtp: () {
          cubit.resendOtp();
        }
      ),
    );
  }
}
