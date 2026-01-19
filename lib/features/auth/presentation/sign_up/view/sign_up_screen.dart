import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/design_system/theme/color/app_constant_colors.dart';
import '../../../../../core/design_system/theme/helper/PopupHelper.dart';
import '../../../../../core/design_system/theme/helper/theme_extention.dart';
import '../../../../../core/di/injection_container.dart';
import '../logic/sign_up_cubit.dart';
import '../logic/sign_up_state.dart';
import '../verify_otp_popup/logic/verify_otp_cubit.dart';
import '../verify_otp_popup/view/verify_otp_popup.dart';
import '../widgets/build_already_have_account.dart';
import '../widgets/build_signup_button.dart';
import '../widgets/build_signup_form.dart';
import '../widgets/build_terms_and_conditions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    cubit.setupTextFieldController();
    return BlocConsumer<SignUpCubit, SignUpUiState>(
        listener: (BuildContext context, SignUpUiState state) {
          if (state.isRegistered ) {
            PopupHelper.show(
              context: context,
              popup: BlocProvider(
                create: (_) => sl<VerifyOtpCubit>(),
                child: VerifyOtpPopUp(
                  email: state.email,
                  type: 'registration'.tr(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 44, 32,0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _logoSignUp(context),

                            SizedBox(height: 12),

                            Text(
                              "Work Mate".tr(),
                              style: context.textTheme.headLineSmallFont
                                  .copyWith(
                                fontWeight: .w600,
                                color: context.colors.textPrimary,
                              ),
                            ),

                            Text(
                              "Register Using Your Credentials".tr(),
                              style: context.textTheme.titleSmallFont
                                  .copyWith(
                                color: context.colors.textSecondary,
                              ),
                            ),

                            SizedBox(height: 24),

                            buildSignUpForm(context, cubit),
                            SizedBox(height: 12),

                            buildTermsAndConditions(
                              context,
                              isChecked: cubit.state
                                  .isCheckedTermAndConditions,
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
        }
    );
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
      child: Icon(Iconsax.login4, color: AppConstantColors.white, size: 40),
    );
  }
}