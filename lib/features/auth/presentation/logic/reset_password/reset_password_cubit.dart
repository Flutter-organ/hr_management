import 'package:hr_management/features/auth/presentation/logic/reset_password/reset_password_state.dart';
import '../../../../../core/base_viewmodel/base_cubit.dart';
import '../../../domain/usecases/ResetPasswordUseCase.dart';

class ResetPasswordCubit extends BaseCubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(this._resetPasswordUseCase)
      : super(const ResetPasswordState());

  Future<void> submit() async {
    if (!_validate()) return;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(isLoading: true, clearApiError: true)),
      call: () => _resetPasswordUseCase(
        identifier: state.identifier,
        code: state.otp,
        password: state.password,
        passwordConfirmation: state.confirmPassword,
      ),
      onSuccess: (user) {
        updateState((s) => s.copyWith(isLoading: false, isSuccess: true, user: user));
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

  void onOtpChanged(String value) {
    updateState((s) => s.copyWith(
      otp: value,
      clearOtpError: true,
      clearApiError: true,
    ));
  }

  void onPasswordChanged(String value) {
    updateState((s) => s.copyWith(
      password: value,
      clearPasswordError: true,
      clearConfirmPasswordError: true,
      clearApiError: true,
    ));
  }

  void onConfirmPasswordChanged(String value) {
    updateState((s) => s.copyWith(
      confirmPassword: value,
      clearConfirmPasswordError: true,
      clearApiError: true,
    ));
  }

  void setIdentifier(String identifier) {
    updateState((s) => s.copyWith(identifier: identifier));
  }

  void clearError() {
    updateState((s) => s.copyWith(clearApiError: true,
        clearOtpError: true,
        clearPasswordError: true,
        clearConfirmPasswordError: true));
  }

  bool _validate() {
    bool isValid = true;

    if (state.otp.isEmpty) {
      updateState((s) => s.copyWith(otpError: 'OTP is required'));
      isValid = false;
    } else if (state.otp.length != 6) {
      updateState((s) => s.copyWith(otpError: 'OTP must be 6 digits'));
      isValid = false;
    }

    if (state.password.isEmpty) {
      updateState((s) => s.copyWith(passwordError: 'Password is required'));
      isValid = false;
    } else if (state.password.length < 8) {
      updateState((s) => s.copyWith(passwordError: 'Password must be at least 8 characters'));
      isValid = false;
    }

    if (state.confirmPassword.isEmpty) {
      updateState((s) => s.copyWith(confirmPasswordError: 'Please confirm your password'));
      isValid = false;
    } else if (state.confirmPassword != state.password) {
      updateState((s) => s.copyWith(confirmPasswordError: 'Passwords do not match'));
      isValid = false;
    }

    return isValid;
  }
}