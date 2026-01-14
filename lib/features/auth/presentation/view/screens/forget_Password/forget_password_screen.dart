// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../../core/design_system/components/popups/custom_popup.dart';
// import '../../../../../../core/design_system/theme/helper/theme_extention.dart';
// import '../../../../../../core/di/injection_container.dart';
// import '../../../../domain/enitites/login_type.dart';
// import '../../../logic/forget_password/forgot_password_cubit.dart';
// import '../../../logic/forget_password/forgot_password_state.dart';
// import '../verify_otp/verify_otp_screen.dart';
//
// class ForgotPasswordPopup extends StatefulWidget {
//   const ForgotPasswordPopup({super.key});
//
//   static Future<void> show(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => Padding(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//         ),
//         child: BlocProvider(
//           create: (_) => sl<ForgotPasswordCubit>(),
//           child: const ForgotPasswordPopup(),
//         ),
//       ),
//     );
//   }
//
//   @override
//   State<ForgotPasswordPopup> createState() => _ForgotPasswordPopupState();
// }
//
// class _ForgotPasswordPopupState extends State<ForgotPasswordPopup> {
//   final _emailController = TextEditingController();
//   String? _emailError;
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }
//
//   bool _validate() {
//     final email = _emailController.text.trim();
//
//     if (email.isEmpty) {
//       setState(() => _emailError = 'email_required'.tr());
//       return false;
//     }
//
//     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
//       setState(() => _emailError = 'invalid_email'.tr());
//       return false;
//     }
//
//     setState(() => _emailError = null);
//     return true;
//   }
//
//   void _onSendCode() {
//     if (_validate()) {
//       context.read<ForgotPasswordCubit>().forgotPassword(
//         identifier: _emailController.text.trim(),
//         loginType: LoginType.email,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
//       listener: (context, state) {
//         if (state is ForgotPasswordSuccess) {
//           Navigator.of(context).pop();
//           VerifyOtpPopup.show(
//             context,
//             identifier: state.identifier,
//             loginType: LoginType.email,
//           );
//         } else if (state is ForgotPasswordError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(state.message),
//               backgroundColor: context.colors.error,
//               behavior: SnackBarBehavior.floating,
//             ),
//           );
//         }
//       },
//       buildWhen: (previous, current) => current.emailError != previous.emailError,
//       builder: (context, state) {
//         final isLoading = state is ForgotPasswordLoading;
//
//         return CustomPopup.forgotPasswordPopup(
//           title: 'forgot_password'.tr(),
//           description: 'forgot_password_description'.tr(),
//           emailController: _emailController,
//           emailErrorText: _emailError,
//           enabled: !isLoading,
//           primaryButtonText: 'send_verification_code'.tr(),
//           isPrimaryButtonLoading: isLoading,
//           isPrimaryButtonEnabled: !isLoading,
//           primaryButtonOnPressed: _onSendCode,
//         );
//       },
//     );
//   }
// }