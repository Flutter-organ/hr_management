import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/sign_up_cubit.dart';

Widget buildEmail(BuildContext context, TextEditingController _emailController) {
  final cubit = context.read<SignUpCubit>();
  return CustomInputField(
      label: "email_label".tr(),
      labelColor: context.colors.textPrimary,
      controller: _emailController,
      borderColor: context.colors.gray400,
      filledColor: context.colors.white,
      keyboardType: TextInputType.visiblePassword,
      hintKey: "email_hint".tr(),
      labelHintStyle: context.colors.gray400,
      hintFontSize: 4,
      enabledColor: context.colors.gray400,
      radius: 8,
      prefixIcon: Icon(Iconsax.sms, color: context.colors.purple500),
      validator: cubit.validateEmail
  );
}