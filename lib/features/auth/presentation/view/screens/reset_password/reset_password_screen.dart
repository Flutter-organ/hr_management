// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../../../../core/design_system/components/popups/custom_popup.dart';
// import '../../../../../../core/design_system/theme/helper/theme_extention.dart';
// import '../../../../../../core/di/injection_container.dart';
// import '../../../logic/reset_password/reset_password_cubit.dart';
// import '../../../logic/reset_password/reset_password_state.dart';
//
// class ResetPasswordPopupScreen extends StatefulWidget {
//   const ResetPasswordPopupScreen({
//     super.key,
//     required this.identifier,
//     required this.otp,
//   });
//
//   final String identifier;
//   final String otp;
//
//   static Future<void> show(
//       BuildContext context, {
//         required String identifier,
//         required String otp,
//       }) {
//     return showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => Padding(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//         ),
//         child: BlocProvider(
//           create: (_) => sl<ResetPasswordCubit>(),
//           child: ResetPasswordPopupScreen(
//             identifier: identifier,
//             otp: otp,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   State<ResetPasswordPopupScreen> createState() => _ResetPasswordPopupState();
// }
//
// class _ResetPasswordPopupState extends State<ResetPasswordPopupScreen> {
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//
//   String? _passwordError;
//   String? _confirmPasswordError;
//
//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   bool _validate() {
//     bool isValid = true;
//
//     if (_passwordController.text.isEmpty) {
//       setState(() => _passwordError = 'password_required'.tr());
//       isValid = false;
//     } else if (_passwordController.text.length < 8) {
//       setState(() => _passwordError = 'password_min_length'.tr());
//       isValid = false;
//     } else {
//       setState(() => _passwordError = null);
//     }
//
//     if (_confirmPasswordController.text.isEmpty) {
//       setState(() => _confirmPasswordError = 'confirm_password_required'.tr());
//       isValid = false;
//     } else if (_confirmPasswordController.text != _passwordController.text) {
//       setState(() => _confirmPasswordError = 'passwords_do_not_match'.tr());
//       isValid = false;
//     } else {
//       setState(() => _confirmPasswordError = null);
//     }
//
//     return isValid;
//   }
//
//   void _onSubmit() {
//     if (_validate()) {
//       context.read<ResetPasswordCubit>().resetPassword(
//         identifier: widget.identifier,
//         code: widget.otp,
//         password: _passwordController.text,
//         passwordConfirmation: _confirmPasswordController.text,
//       );
//     }
//   }
//
//   void _showSuccessPopup() {
//     showModalBottomSheet(
//       context: context,
//       isDismissible: false,
//       enableDrag: false,
//       backgroundColor: Colors.transparent,
//       builder: (context) => CustomPopup.singleactionpopup(
//         icon: Iconsax.shield_tick,
//         title: 'password_created'.tr(),
//         description: 'password_created_description'.tr(),
//         primaryButtonText: 'sign_in'.tr(),
//         primaryButtonOnPressed: () {
//           Navigator.of(context).pop();
//           context.go('/auth/login');
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
//       listener: (context, state) {
//         if (state is ResetPasswordSuccess) {
//           Navigator.of(context).pop();
//           _showSuccessPopup();
//         } else if (state is ResetPasswordError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(state.message),
//               backgroundColor: context.colors.error,
//               behavior: SnackBarBehavior.floating,
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         final isLoading = state is ResetPasswordLoading;
//
//         return CustomPopup.resetPasswordPopup(
//           title: 'set_new_password'.tr(),
//           description: 'set_new_password_description'.tr(),
//           passwordController: _passwordController,
//           confirmPasswordController: _confirmPasswordController,
//           passwordErrorText: _passwordError,
//           confirmPasswordErrorText: _confirmPasswordError,
//           enabled: !isLoading,
//           primaryButtonText: 'submit'.tr(),
//           isPrimaryButtonLoading: isLoading,
//           isPrimaryButtonEnabled: !isLoading,
//           primaryButtonOnPressed: _onSubmit,
//         );
//       },
//     );
//   }
// }