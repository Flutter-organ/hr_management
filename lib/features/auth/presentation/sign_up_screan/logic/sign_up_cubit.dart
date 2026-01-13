import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:hr_management/features/auth/presentation/sign_up_screan/logic/sign_up_state.dart';

import '../../../../../core/base_viewmodel/base_cubit.dart';
import '../../../../../core/exceptions/ui_errors.dart';
import '../../../domain/enitites/Register.dart';
import '../../../domain/usecase/RegisterUseCase.dart';

class SignUpCubit extends BaseCubit<SignUpUiState> {
  SignUpCubit(this._registerUseCase) : super(SignUpUiState());
  final formKey = GlobalKey<FormState>();
  final RegisterUseCase _registerUseCase;
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController = TextEditingController();
  final String registerType = 'email';


  void setupTextFieldController() {
    emailController.addListener(_onTextChanged);
    phoneController.addListener(_onTextChanged);
    passwordController.addListener(_onTextChanged);
    confirmPasswordController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    updateState(
          (state) => state.copyWith(
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      ),
    );
    _updateButtonState();
  }
  void onToggleTerms(bool value) {
    updateState(
          (state) => state.copyWith(isCheckedTermAndConditions: value),
    );
    _updateButtonState();
  }
  void _updateButtonState() {
    final enable = state.isCheckedTermAndConditions &&
        state.email.isNotEmpty &&
        state.phone.isNotEmpty &&
        state.password.isNotEmpty &&
        state.confirmPassword.isNotEmpty &&
        state.countryCode.isNotEmpty;

    updateState((state) => state.copyWith(isEnableSignUpButton: enable));
  }


  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final fullPhoneNumber =
        '${state.countryCode}${phoneController.text.trim()}';
    execute(
      call: () {
        final isRegistered = _registerUseCase.call(
          register: Register(
            email: emailController.text.trim(),
            phone: fullPhoneNumber,
            password: passwordController.text.trim(),
            passwordConfirmation: confirmPasswordController.text.trim(),
            registerType: registerType,
          ),
        );
        return isRegistered;
      },
      onSuccess: (_) {
        updateState(
          (currentState) => currentState.copyWith(
            email: emailController.text,
            isRegistered: true,
          ),
        );
      },
      onError: (error) {
        emit(SignUpUiState(errorMessage: error.message));
      },
    );
  }

  void toggleObscurePassword() {
    updateState(
      (currentState) =>
          currentState.copyWith(isObscurePassWord: !state.isObscurePassWord),
    );
  }

  void setCountryCode(String code) {
    SignUpUiState(countryCode: code);
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
