import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import '../../logic/sign_up_cubit.dart';
import 'build_email.dart';
import 'build_password.dart';
import 'build_phone_number.dart';

Widget buildSignUpForm(BuildContext context, SignUpCubit cubit) {
  return Form(
    key: cubit.formKey,
    child: Column(
      spacing: 16,
      children: [
        buildEmail(
          context,
          cubit.emailController,
        ),
        buildPhoneNumber(
          context,
          cubit.phoneController,
        ),
        buildPassword(
          context,
          cubit.passwordController,
          "password".tr(),
        ),
        buildPassword(
          context,
          cubit.confirmPasswordController,
          "confirm_password".tr(),
        ),
      ],
    ),
  );
}