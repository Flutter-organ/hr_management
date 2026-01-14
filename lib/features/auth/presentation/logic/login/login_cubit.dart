import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/base_viewmodel/base_cubit.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState>  {
  // TODO: Add LoginUseCase when implemented
  // final LoginUseCase _loginUseCase;

  LoginCubit() : super(const LoginState());

  Future<void> submit() async {
    if (!_validate()) return;

    // TODO: Replace with actual use case call when ready
    await _submitDummy();

    // When LoginUseCase is ready, replace _submitDummy() with this:
    /*
    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoading: true,
        clearApiError: true,
      )),
      call: () => _loginUseCase(
        identifier: state.email.trim(),
        password: state.password,
        loginType: LoginType.email,
      ),
      onSuccess: (user) {
        updateState((s) => s.copyWith(
          isLoading: false,
          isSuccess: true,
          user: user,  // Add user to LoginState if needed
        ));
      },
      onError: (failure) {
        updateState((s) => s.copyWith(
          isLoading: false,
          apiError: failure.message,
          isSuccess: false,
        ));
      },
    );
    */
  }

  void onEmailChanged(String value) {
    updateState((s) => s.copyWith(
      email: value,
      clearEmailError: true,
      clearApiError: true,
    ));
  }

  void onPasswordChanged(String value) {
    updateState((s) => s.copyWith(
      password: value,
      clearPasswordError: true,
      clearApiError: true,
    ));
  }

  void clearError() {
    updateState((s) => s.copyWith(
      clearEmailError: true,
      clearPasswordError: true,
      clearApiError: true,
    ));
  }

  Future<void> _submitDummy() async {
    updateState((s) => s.copyWith(isLoading: true, clearApiError: true));

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Simulate success
    updateState((s) => s.copyWith(
      isLoading: false,
      isSuccess: true,
    ));

    // To simulate error, uncomment this instead:
    // updateState((s) => s.copyWith(
    //   isLoading: false,
    //   apiError: 'Invalid credentials',
    // ));
  }

  bool _validate() {
    bool isValid = true;

    final email = state.email.trim();
    if (email.isEmpty) {
      updateState((s) => s.copyWith(emailError: 'Email is required'));
      isValid = false;
    } else if (!_isValidEmail(email)) {
      updateState((s) => s.copyWith(emailError: 'Please enter a valid email'));
      isValid = false;
    }

    if (state.password.isEmpty) {
      updateState((s) => s.copyWith(passwordError: 'Password is required'));
      isValid = false;
    } else if (state.password.length < 8) {
      updateState((s) => s.copyWith(
        passwordError: 'Password must be at least 8 characters',
      ));
      isValid = false;
    }

    return isValid;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

}