import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';

Widget buildPassword(
    BuildContext context,
    TextEditingController passwordController,
    String label) {
  final cubit = context.read<SignUpCubit>();
  return BlocBuilder<SignUpCubit, SignUpUiState>(
    buildWhen: (previous, current) => current.isObscurePassWord!=previous.isObscurePassWord,
    builder: (context, state) {
      return CustomInputField(
          label: label,
          labelColor: context.colors.textPrimary,
          controller: passwordController,
          borderColor: context.colors.gray400,
          filledColor: context.colors.white,
          keyboardType: TextInputType.visiblePassword,
          hintKey: "password_hint".tr(),
          isObscureText: cubit.state.isObscurePassWord,
          labelHintStyle: context.colors.gray400,
          hintFontSize: 4,
          enabledColor: context.colors.gray400,
          radius: 8,
          suffixIcon: IconButton(
            onPressed: () {
             cubit.toggleObscurePassword();
            },
            icon: Icon(
              cubit.state.isObscurePassWord ? Iconsax.eye_slash : Iconsax.eye,
            ),
            color: context.colors.purple500,
          ),
          prefixIcon: Icon(Iconsax.lock, color: context.colors.purple500),
          validator: cubit.validatePassword
      );
    },
  );
}
