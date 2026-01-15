import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/check_box.dart';
import 'package:hr_management/core/design_system/components/custom_input_field.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';

enum LoginType { email, phone }

class SignInPopup extends StatefulWidget {
  const SignInPopup({super.key});

  @override
  State<SignInPopup> createState() => _SignInPopupState();
}

class _SignInPopupState extends State<SignInPopup> {
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
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  LoginType loginType = LoginType.email;
  bool isChecked = false;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final color = context.colors;
    final textTheme = context.textTheme;
    final bool isMyFieldFocused = FocusScope.of(context).hasFocus;
    return Padding(
      padding: EdgeInsets.only(
        bottom: isMyFieldFocused ? MediaQuery.of(context).viewInsets.bottom : 0,
      ),
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(32, 40, 32, 32),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: .center,
              mainAxisSize: .min,
              children: [
                Text(
                  "sign_in".tr(),
                  style: textTheme.headLineSmallFont.copyWith(
                    fontWeight: .w600,
                    color: color.textPrimary,
                  ),
                ),
                Text(
                  "sign_to_account".tr(),
                  style: textTheme.titleSmallFont.copyWith(
                    color: color.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: loginType == LoginType.email
                      ? _buildSignInWithEmail(color, textTheme)
                      : _buildSignInWithPhone(textTheme, color, context),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: CustomCheckbox(
                        isChecked: isChecked,
                        label: "remember_me".tr(),
                        onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                    ),
                    CustomPrimaryButton.text(
                      onPressed: () {},
                      padding: EdgeInsetsGeometry.zero,
                      buttonText: "forgot_password".tr(),
                      textStyle: textTheme.bodySmallFont.copyWith(
                        color: color.purple600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                CustomPrimaryButton.gradient(
                  onPressed: () {},
                  buttonText: "sign_in".tr(),
                  textStyle: textTheme.labelLargeFont.copyWith(
                    color: color.pureWhite,
                  ),
                ),
                const SizedBox(height: 32),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: color.gray200,
                        thickness: 1,
                        height: 10,
                        endIndent: 16,
                      ),
                    ),
                    Text(
                      "or".tr(),
                      style: textTheme.labelMediumFont.copyWith(
                        color: color.gray400,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 16,
                        color: color.gray200,
                        thickness: 1,
                        height: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                CustomPrimaryButton.outlined(
                  borderColor: color.purple500,
                  onPressed: () {
                    setState(() {
                      loginType = loginType == LoginType.email
                          ? LoginType.phone
                          : LoginType.email;
                    });
                  },
                  //foregroundColor: color.purple500,
                  buttonText: loginType == LoginType.email
                      ? "sign_with_phone".tr()
                      : "sign_with_email".tr(),
                  icon: Icon(
                    loginType == LoginType.email ? Iconsax.call5 : Iconsax.sms,
                    color: color.purple500,
                  ),
                ),

                const SizedBox(height: 24),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "dont_have_account".tr(),
                        style: textTheme.labelSmallFont.copyWith(
                          color: color.textPrimary,
                        ),
                      ),
                      TextSpan(
                        spellOut: true,
                        text: "sign_up_here".tr(),
                        style: textTheme.labelSmallFont.copyWith(
                          color: color.purple600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithEmail(dynamic color, dynamic textTheme) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "email".tr(),
            style: textTheme.bodySmallFont.copyWith(color: color.gray600),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 4),

        CustomInputField(
          controller: _emailController,
          borderColor: color.gray400,
          filledColor: color.white,
          hintKey: "my_email".tr(),
          keyboardType: TextInputType.emailAddress,
          labelHintStyle: color.gray400,
          hintFontSize: 4,
          enabledColor: color.gray400,
          radius: 8,
          prefixIcon: Icon(Iconsax.sms, color: color.purple500),
        ),
        const SizedBox(height: 24),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "password".tr(),
            style: textTheme.bodySmallFont.copyWith(color: color.gray600),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 4),
        CustomInputField(
          controller: _passwordController,
          borderColor: color.gray400,
          filledColor: color.white,
          keyboardType: TextInputType.visiblePassword,
          hintKey: "my_password".tr(),
          isObscureText: isObscure,
          labelHintStyle: color.gray400,
          hintFontSize: 4,
          enabledColor: color.gray400,
          radius: 8,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            icon: Icon(isObscure ? Iconsax.eye_slash : Iconsax.eye),
            color: color.purple500,
          ),
          prefixIcon: Icon(Iconsax.scan, color: color.purple500),
        ),
      ],
    );
  }

  Widget _buildSignInWithPhone(
    dynamic textTheme,
    dynamic color,
    BuildContext context,
  ) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "phone_number".tr(),
            style: textTheme.bodySmallFont.copyWith(
              fontWeight: FontWeight.w400,
              color: color.gray600,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 4),

        CustomInputField(
          controller: _phoneController,
          borderColor: color.gray400,
          filledColor: color.white,
          keyboardType: TextInputType.number,
          hintKey: "01*********",
          labelHintStyle: color.gray400,
          hintFontSize: 4,
          enabledColor: color.gray400,
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
                  textStyle: textTheme.titleSmallFont.copyWith(
                    color: color.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  searchTextStyle: textTheme.titleSmallFont.copyWith(
                    color: color.textPrimary,
                  ),
                  inputDecoration: InputDecoration(
                    labelText: 'search'.tr(),
                    hintText: 'search_country'.tr(),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  bottomSheetHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                showPhoneCode: true,
                countryFilter: countryFilter,
                favorite: ['PS', 'EG', 'SA'],
                onSelect: (Country country) {
                  setState(() {
                    _countryCode = country.phoneCode;
                  });
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
                    style: textTheme.titleSmallFont.copyWith(
                      color: color.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Iconsax.arrow_down_1, color: color.purple500),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
