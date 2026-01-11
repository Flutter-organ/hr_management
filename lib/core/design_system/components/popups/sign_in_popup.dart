import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/core/design_system/components/check_box.dart';
import 'package:hr_management/core/design_system/components/custom_input_field.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:hr_management/features/auth/presentation/login_feature/cubit/login_cubit.dart';
import 'package:hr_management/features/auth/presentation/login_feature/cubit/login_states.dart';
import 'package:iconsax/iconsax.dart';

enum LoginType { email, phone }

class SignInPopup extends StatefulWidget {
  const SignInPopup({super.key});

  @override
  State<SignInPopup> createState() => _SignInPopupState();
}

class _SignInPopupState extends State<SignInPopup> {
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

  @override
  Widget build(BuildContext context) {
    final color = context.colors;
    final textTheme = context.textTheme;
    final bool isMyFieldFocused = FocusScope.of(context).hasFocus;
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showDialog(
            context: context,
            builder: (context) => Dialog(child: Text("login_success".tr())),
          );
        }

        if (state is LoginFailure) {
          showDialog(
            context: context,
            builder: (context) => Dialog(child: Text(state.message)),
          );
        }
      },
      builder: (context, state) => Padding(
        padding: EdgeInsets.only(
          bottom: isMyFieldFocused
              ? MediaQuery.of(context).viewInsets.bottom
              : 0,
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
                    child: state.loginType == LoginType.email
                        ? _buildSignInWithEmail(color, textTheme, state)
                        : _buildSignInWithPhone(textTheme, color, state),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "password".tr(),
                      style: textTheme.bodySmallFont.copyWith(
                        color: color.gray600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 4),
                  CustomInputField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "password_required".tr();
                      }
                      if (value.length < 8) {
                        return "password_too_short".tr();
                      }
                      return null;
                    },
                    onChanged: (value) {
                      context.read<LoginCubit>().filledFields(
                        state.loginType == LoginType.email
                            ? _emailController.text
                            : _phoneController.text,
                        value,
                      );
                    },
                    controller: _passwordController,
                    borderColor: color.gray400,
                    filledColor: color.white,
                    keyboardType: TextInputType.visiblePassword,
                    hintKey: "my_password".tr(),
                    isObscureText: state.isObscure,
                    labelHintStyle: color.gray400,
                    hintFontSize: 4,
                    enabledColor: color.gray400,
                    radius: 8,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<LoginCubit>().togglePassword();
                      },
                      icon: Icon(
                        state.isObscure ? Iconsax.eye_slash : Iconsax.eye,
                      ),
                      color: color.purple500,
                    ),
                    prefixIcon: Icon(Iconsax.scan, color: color.purple500),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: CustomCheckbox(
                          isChecked: state.isChecked,
                          label: "remember_me".tr(),
                          onChanged: (value) {
                            context.read<LoginCubit>().isRememberd(value);
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
                    isEnabled: state.isEnabled,
                    isLoading: state is LoginLoading,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await context.read<LoginCubit>().login(
                          identifier: state.loginType == LoginType.email
                              ? _emailController.text
                              : '+' + state.countryCode + _phoneController.text,
                          password: _passwordController.text,
                          loginType: state.loginType == LoginType.email
                              ? "email"
                              : 'phone',
                        );
                      }
                    },
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
                      FocusScope.of(context).unfocus();
                      _formKey.currentState?.reset();
                      _emailController.clear();
                      _phoneController.clear();
                      _passwordController.clear();
                      context.read<LoginCubit>().filledFields("", "");
                      context.read<LoginCubit>().toggleLogintype();
                    },
                    //foregroundColor: color.purple500,
                    buttonText: state.loginType == LoginType.email
                        ? "sign_with_phone".tr()
                        : "sign_with_email".tr(),
                    icon: Icon(
                      state.loginType == LoginType.email
                          ? Iconsax.call5
                          : Iconsax.sms,
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
      ),
    );
  }

  Widget _buildSignInWithEmail(
    dynamic color,
    dynamic textTheme,
    LoginStates state,
  ) {
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "email_required".tr();
            }
            final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            if (!emailRegex.hasMatch(value)) {
              return "invalid_email_format".tr();
            }
            return null;
          },
          labelErrorStyle: color.error,
          onChanged: (value) {
            context.read<LoginCubit>().filledFields(
              value,
              _passwordController.text,
            );
          },
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
      ],
    );
  }

  Widget _buildSignInWithPhone(
    dynamic textTheme,
    dynamic color,
    LoginStates state,
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
          onChanged: (value) {
            context.read<LoginCubit>().filledFields(
              value,
              _passwordController.text,
            );
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "phone_required".tr();
            }
            if (value.length < 11) {
              return "invalid_phone".tr();
            }
            return null;
          },
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
                countryFilter: state.countryFilter,
                favorite: ['PS', 'EG', 'SA'],
                onSelect: (Country country) {
                  context.read<LoginCubit>().changeCountryCode(country);
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "+${state.countryCode}",
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
