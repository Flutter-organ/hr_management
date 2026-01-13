import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/design_system/components/popups/custom_popup.dart';
import '../logic/verify_otp_cubit.dart';

class VerifyOtpBottomSheet extends StatelessWidget {
  final String email;
  final String type;

  const VerifyOtpBottomSheet({
    super.key,
    required this.email,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyOtpCubit>();

    return CustomPopup.phoneAuthPopup(
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
        cubit.verifyOtp(email: email, type: 'registration');
      },
      onCompleted: (code) {
        cubit.setOtp(code);
      },
      onTapResend: () {
        cubit.resendOtp();
      },
      onTapHere: () {},
    );
  }
}
