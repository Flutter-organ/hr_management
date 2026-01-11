import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/design_system/components/popups/custom_popup.dart';
import '../../helpers/auth_popup_helper.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
  const PasswordResetSuccessScreen({super.key});

  static Future<void> show(BuildContext context) async {
    await AuthPopupHelper.showAuthPopup(
      context: context,
      isDismissible: false, // User must tap Sign In
      popup: _PasswordResetSuccessPopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _PasswordResetSuccessPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPopup.singleactionpopup(
      icon: Iconsax.shield_tick,
      title: 'password_created'.tr(),
      description: 'password_created_description'.tr(),
      primaryButtonText: 'sign_in'.tr(),
      primaryButtonOnPressed: () {

        Navigator.of(context).pop();
        context.go('/auth/login');
      },
    );
  }
}