import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/design_system/components/check_box.dart';
import '../../../../../core/design_system/components/custom_input_field.dart';
import '../../../../../core/design_system/components/custom_primary_button.dart';
import '../../../../../core/design_system/theme/color/app_constant_colors.dart';
import '../../../../../core/design_system/theme/helper/extention_colors.dart';
import '../../../../../core/design_system/theme/helper/theme_extention.dart';
import '../logic/sign_up_cubit.dart';
import '../logic/sign_up_state.dart';

class SignUpScreen extends StatelessWidget {

  late bool isObscure = true;

  late bool isChecked = false;



  @override
  Widget build(BuildContext context) {
    context.read<SignUpCubit>().setupTextFieldController();
    return BlocConsumer<SignUpCubit, SignUpStates>(
  listener: (context, state) {
    print("sssssssssssssssttttttttttttttttttttttttttttt $state");
    if (state is FailureState) {
      print("sssssssssssssssttttttttttttttttttttttttttttt ${state.message}");
    }

  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: Text("title")),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _logoSignUp(context),

                      SizedBox(height: 12),

                      Text(
                        "Work Mate".tr(),
                        style: context.textTheme.headLineSmallFont.copyWith(
                          fontWeight: .w600,
                          color: context.colors.textPrimary,
                        ),
                      ),

                      Text(
                        "Register Using Your Credentials".tr(),
                        style: context.textTheme.titleSmallFont.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),

                      SizedBox(height: 24),

                      Form(
                        child: Column(
                          spacing:16,
                        children: [
                          _buildEmail(context, context.read<SignUpCubit>().emailController),

                          _buildPhoneNumber(context, context.read<SignUpCubit>().phoneController),

                          _buildPassword(context, context.read<SignUpCubit>().passwordController, isObscure,
                              "password".tr()),

                          _buildPassword(context,  context.read<SignUpCubit>().confirmPasswordController, isObscure,
                              "confirm_password".tr()),
                        ],
                      )
                      ),
                      SizedBox(height: 12),

                      _buildTermsAndConditions(context, isChecked: isChecked,
                          onChanged: (bool value) {}),
                      SizedBox(height: 36),
                      if (state is LoadingState)
                        CircularProgressIndicator()
                      else
                      _buildSignUpButton(context, context.read<SignUpCubit>().signUp),

                    ],
                  ),
                ),
              ),
            ),
            _buildAlreadyHaveAnAccount(context),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  },
);
  }
}

Widget _logoSignUp(BuildContext context) {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: AppConstantColors.purple500,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: AppConstantColors.purple500.withOpacity(0.4),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Icon(
      Icons.person,
      color: AppConstantColors.white,
      size: 40,
    ),
  );
}
Widget _buildEmail(BuildContext context, TextEditingController _emailController) {
  return CustomInputField(
    label: "Email".tr(),
    labelColor: context.colors.textPrimary,
    controller: _emailController,
    borderColor: context.colors.gray400,
    filledColor: context.colors.white,
    keyboardType: TextInputType.visiblePassword,
    hintKey: "name@email.com".tr(),
    labelHintStyle: context.colors.gray400,
    hintFontSize: 4,
    enabledColor: context.colors.gray400,
    radius: 8,
    prefixIcon: Icon(Iconsax.sms, color: context.colors.purple500),
  );
}
Widget _buildPhoneNumber(BuildContext context, TextEditingController _phoneController) {
  List<String> countryFilter = [
    'EG',
    'PS',
    'SA',
    'AE',
    'KW',
    'QA',
    'JO',
    'LB',
    'SY',
    'IQ',
    'OM',
    'BH',
    'LY',
    'MA',
    'DZ',
    'TN',
    'SD',
    'YE',
  ];

  String _countryCode = "20";
  return CustomInputField(
    label: "phone_number".tr(),
    labelColor: context.colors.textPrimary,
    controller: _phoneController,
    borderColor: context.colors.gray400,
    filledColor: context.colors.white,
    keyboardType: TextInputType.number,
    hintKey: "01*********",
    labelHintStyle: context.colors.gray400,
    hintFontSize: 4,
    enabledColor: context.colors.gray400,
    radius: 8,
    prefixIcon: InkWell(
      onTap: () {
        showCountryPicker(
          moveAlongWithKeyboard: true,
          context: Navigator.of(context, rootNavigator: true).context,
          countryListTheme: CountryListThemeData(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            textStyle: context.textTheme.titleSmallFont.copyWith(
              color: context.colors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            searchTextStyle: context.textTheme.titleSmallFont
                .copyWith(color: context.colors.textPrimary),
            inputDecoration: InputDecoration(
              labelText: 'search'.tr(),
              hintText: 'search_country'.tr(),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            bottomSheetHeight:
            MediaQuery.of(context).size.height * 0.6,
          ),
          showPhoneCode: true,
          countryFilter: countryFilter,
          favorite: ['PS', 'EG', 'SA'],
          onSelect: (Country country) {
              _countryCode = country.phoneCode;
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "+$_countryCode",
              style: context.textTheme.titleSmallFont.copyWith(
                color: context.colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Iconsax.arrow_down_1,
              color: context.colors.purple500,
            ),
          ],
        ),
      ),
    ),
  );

}
Widget _buildPassword(BuildContext context, TextEditingController _passwordController, bool isObscure,String label) {
  late bool isObscure = true;
  return CustomInputField(
    label: label,
    labelColor: context.colors.textPrimary,
    controller: _passwordController,
    borderColor: context.colors.gray400,
    filledColor: context.colors.white,
    keyboardType: TextInputType.visiblePassword,
    hintKey: "my_password".tr(),
    isObscureText: isObscure,
    labelHintStyle: context.colors.gray400,
    hintFontSize: 4,
    enabledColor: context.colors.gray400,
    radius: 8,
    suffixIcon: IconButton(
      onPressed: () {
          isObscure = !isObscure;
      },
      icon: Icon(isObscure ? Iconsax.eye_slash : Iconsax.eye),
      color: context.colors.purple500,
    ),
    prefixIcon: Icon(Iconsax.scan, color: context.colors.purple500),
  );

}
Widget _buildTermsAndConditions(BuildContext context, {required bool isChecked,required ValueChanged<bool> onChanged,}) {
  final defaultStyle = context.textTheme.labelMediumFont.copyWith(
    color: context.colors.textPrimary,
  );

  final linkStyle = defaultStyle.copyWith(
    color: AppConstantColors.purple500,
  );

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomCheckbox(
        size: 16,
        isChecked: isChecked,
        onChanged: onChanged,
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Text.rich(
          TextSpan(
            style: defaultStyle,
            children: [
              TextSpan(text: "I agree with ".tr()),
              TextSpan(
                text: "terms & conditions".tr(),
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                  },
              ),
              TextSpan(text: " and ".tr()),
              TextSpan(
                text: "privacy policy".tr(),
                style: linkStyle,
                recognizer: TapGestureRecognizer()
              ),
            ],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
Widget _buildSignUpButton(BuildContext context ,  onSignUpPressed) {
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
    onPressed: onSignUpPressed,
  );
}
Widget _buildAlreadyHaveAnAccount(BuildContext context) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "Already have an account?".tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GestureDetector(
            onTap: (){},
            child: Text(
              "Sign in here".tr(),
              style: context.textTheme.labelMediumFont.copyWith(
                color: AppConstantColors.purple500,
              ),
            ),
          ),
        ),
      ],
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
