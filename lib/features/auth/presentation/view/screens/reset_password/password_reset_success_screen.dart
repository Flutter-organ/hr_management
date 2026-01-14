// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../../../../core/design_system/components/popups/custom_popup.dart';
//
// class PasswordResetSuccessPopup extends StatelessWidget {
//   const PasswordResetSuccessPopup._();
//
//   /// Shows the success popup after password reset
//   static Future<void> show(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       isDismissible: false,
//       enableDrag: false,
//       backgroundColor: Colors.transparent,
//       builder: (bottomSheetContext) => const PasswordResetSuccessPopup._(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPopup.singleactionpopup(
//       icon: Iconsax.shield_tick,
//       title: 'password_created'.tr(),
//       description: 'password_created_description'.tr(),
//       primaryButtonText: 'sign_in'.tr(),
//       primaryButtonOnPressed: () {
//         Navigator.of(context).pop();
//
//         context.go('/auth/login');
//       },
//     );
//   }
// }