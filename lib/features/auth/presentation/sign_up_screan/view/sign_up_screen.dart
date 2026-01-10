import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/design_system/components/popups/terms_popup.dart';
import '../../../../../core/design_system/theme/color/app_constant_colors.dart';
import '../../../../../core/design_system/theme/helper/theme_extention.dart';
import '../logic/sign_up_cubit.dart';
import '../logic/sign_up_state.dart';
import '../widgets/build_already_have_account.dart';
import '../widgets/build_email.dart';
import '../widgets/build_password.dart';
import '../widgets/build_phone_number.dart';
import '../widgets/build_signup_button.dart';
import '../widgets/build_terms_and_conditions.dart';
import '../widgets/show_terms_popup.dart';

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
   cubit.setupTextFieldController();
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (BuildContext context, SignUpStates state) {
        if (state is CheckInputValidationState) {
          context.read<SignUpCubit>().formKey.currentState!.validate();
        }
        if (state is FailureState) {
          print("stateeeeee is ${state.message}");
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
                          ),
                          SizedBox(height: 12),

                          buildTermsAndConditions(
                            context,
                            isChecked: cubit.isCheckedTermAndConditions,
                            onChanged: (value) {
                              cubit.onToggleTerms(value);
                            },
                            ),
                          SizedBox(height: 36),
                          buildSignUpButton(context, () {
                            cubit.signUp();
                          }),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                buildAlreadyHaveAnAccount(context),
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
    child: Icon(Icons.person, color: AppConstantColors.white, size: 40),
  );
}