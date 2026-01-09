import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/features/auth/presentation/sign_up_screan/logic/sign_up_state.dart';

import '../../../domain/usecase/RegisterUseCase.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this._registerUseCase) : super(InitialState());
  final _formKey = GlobalKey<FormState>();
  final RegisterUseCase _registerUseCase;
  late TextEditingController emailController ;
  late TextEditingController phoneController ;
  late TextEditingController passwordController ;
  late TextEditingController confirmPasswordController ;
  late bool _isObscurePassWord = true;
  late bool _isObscureConfirmPassWord = true;
  late bool _isCheckedTermAndConditions = false;
  late String _countryCode = "+20";

  void setupTextFieldController(){
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
}

  void checkInputValidation() {
    if (_formKey.currentState!.validate()) {
      emit(CheckInputValidationState());
    }
  }
 Future<void>  signUp() async {
    emit(LoadingState());
   final isCreated = await _registerUseCase.call(
      email: emailController.text,
      phoneNumber: phoneController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );
   isCreated.fold(
      (failure) {
        emit(FailureState(failure.message));
      },
      (success) {
        emit(SuccessState());
      },
    );

  }
  void toggleObscurePassWord() {
    _isObscurePassWord = !_isObscurePassWord;
  }
  void toggleObscureConfirmPassWord() {
    _isObscureConfirmPassWord = !_isObscureConfirmPassWord;
  }
  void toggleCheckedTermAndConditions() {
    _isCheckedTermAndConditions = !_isCheckedTermAndConditions;
  }
}

//
//
//
//
//
//
//   // ---------------- Validation logic ----------------
//
//   String? _validateEmail(String value) {
//     if (value.isEmpty) return 'Email is required';
//     final emailRegex =
//     RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     return emailRegex.hasMatch(value) ? null : 'Invalid email';
//   }
//
//   String? _validatePassword(String value) {
//     if (value.isEmpty) return 'Password is required';
//     if (value.length < 6) return 'Minimum 6 characters';
//     return null;
//   }
//
//   String? _validatePhone(String value) {
//     if (value.isEmpty) return 'Phone is required';
//     final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
//     return phoneRegex.hasMatch(value) ? null : 'Invalid phone';
//   }
//
//   bool _validateForm({
//     required String email,
//     required String password,
//     required String phone,
//   }) {
//     return _validateEmail(email) == null &&
//         _validatePassword(password) == null &&
//         _validatePhone(phone) == null;
//   }
// }