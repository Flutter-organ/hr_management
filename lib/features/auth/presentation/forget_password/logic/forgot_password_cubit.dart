import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/enitites/auth_type.dart';
import '../../../domain/use_cases/forgot_password_use_case.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends BaseCubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordCubit(this._forgotPasswordUseCase)
      : super(const ForgotPasswordState());

  Future<void> submit() async {
    if (!_validateEmail()) return;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(
          isLoading: true,
          clearEmailError: true,
          isSuccess: false,
          clearApiError: true)),
      call: () => _forgotPasswordUseCase(
        identifier: state.email.trim(),
        loginType: AuthType.email,
      ),
      onSuccess: (identifier) {
        updateState((s) => s.copyWith(isLoading: false, isSuccess: true, successIdentifier: identifier));
      },
      onError: (failure) {
        updateState((s) => s.copyWith(
          isLoading: false,
          apiError: failure.message,
          isSuccess: false,
        ));
      },
    );
  }

  Future<void> resendOtp() async {
    if (!_validateEmail()) return;
    updateState((s) => s.copyWith(
      clearApiError: true,
      isSuccess: false,
    ));
    await submit();
  }

  void reset() {
    updateState((s) => s == const ForgotPasswordState() ? s : const ForgotPasswordState());
  }

  void clearState() {
    updateState((s) => s.copyWith(
      clearApiError: true,
      clearEmailError: true,
      isSuccess: false,
      successIdentifier: null,
    ));
  }

  void onEmailChanged(String value) {
    updateState((state) => state.copyWith(
      email: value,
      clearEmailError: true,
      clearApiError: true,
    ));
  }

  void clearError() {
    updateState((s) => s.copyWith(clearApiError: true, clearEmailError: true));
  }


  bool _validateEmail() {
    final email = state.email.trim();

    if (email.isEmpty) {
      updateState((currentState) => currentState.copyWith(emailError: 'Email is required'));
      return false;
    }

    if (!_isValidEmail(email)) {
      updateState((s) => s.copyWith(emailError: 'Please enter a valid email'));
      return false;
    }

    return true;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}