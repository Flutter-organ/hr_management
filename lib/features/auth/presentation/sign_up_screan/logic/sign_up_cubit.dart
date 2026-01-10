import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:hr_management/features/auth/presentation/sign_up_screan/logic/sign_up_state.dart';

import '../../../../../core/base_viewmodel/base_cubit.dart';
import '../../../domain/usecase/RegisterUseCase.dart';

class SignUpCubit extends BaseCubit<SignUpStates> {
  SignUpCubit(this._registerUseCase) : super(InitialState());
  final formKey = GlobalKey<FormState>();
  final RegisterUseCase _registerUseCase;
  late TextEditingController emailController;

  late TextEditingController phoneController;

  late TextEditingController passwordController;

  late TextEditingController confirmPasswordController;

  late bool isObscurePassWord = true;
  late bool isCheckedTermAndConditions = false;
  late bool isEnableSignUpButton = false;

  late String countryCode = "+20";

  void setupTextFieldController() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }


  void onToggleButtonState() {
    final isFormValid = formKey.currentState?.validate() ?? false;
    final shouldEnable = isFormValid && isCheckedTermAndConditions;

    if (shouldEnable != isEnableSignUpButton) {
      isEnableSignUpButton = shouldEnable;
      emit(CheckInputValidationState());
    }
  }
  void onToggleTerms(bool value) {
    isCheckedTermAndConditions = value;
    onToggleButtonState();
    emit(ToggleCheckedTermAndConditionsState());
  }

  Future<void> signUp() async {
    final fullPhoneNumber = '$countryCode${phoneController.text.trim()}';

    execute(
      onLoading: () => emit(LoadingState()),
      call: () {
        final isRegistered = _registerUseCase.call(
          registerParams: RegisterParams(
            email: emailController.text,
            PhoneNumber: fullPhoneNumber,
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text,
          ),
        );
        return isRegistered;
      },
      onSuccess: (_) {
        emit(SuccessState());
      },
      onError: (error) {
        emit(FailureState(message: error.message));
      },
    );
  }
  void toggleObscurePassword() {
    isObscurePassWord = !isObscurePassWord;
    emit(ShowOrHidePasswordState());
  }

  void setCountryCode(String code) {
    countryCode = "+$code";
    emit(CountryCodeChangedState(countryCode));
  }


  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'invalid_email(name@gmail.com)'.tr();
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'invalid_email'.tr();
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password_required'.tr();
    }

    if (value.length < 6) {
      return 'password_short'.tr();
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'password_not_match'.tr();
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone_required'.tr();
    }

    final phoneRegex = RegExp(r'^[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'invalid_phone'.tr();
    }

    return null;
  }
}
