import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/design_system/components/custom_primary_button.dart';
import '../../../../../core/design_system/theme/helper/extention_colors.dart';
import '../../../../../core/design_system/theme/helper/theme_extention.dart';
import '../logic/sign_up_cubit.dart';

Widget buildSignUpButton(BuildContext context , onSignUpPressed) {
  final cubit = context.read<SignUpCubit>();
  return CustomPrimaryButton.gradient(
    height: 48,
    textStyle: context.textTheme.labelLargeFont.copyWith(
      color: context.colors.white,
    ),
    gradient: LinearGradient(
      colors: [
        ExtensionColors.purpleGradient0,
        ExtensionColors.purpleGradient1,
        ExtensionColors.purpleGradient2,
      ],
    ),
    buttonText: "sign_up".tr(),
    borderRadius: 100,
    onPressed:  cubit.state.isEnableSignUpButton ? onSignUpPressed : null,
    isEnabled:  cubit.state.isEnableSignUpButton,
  );
}