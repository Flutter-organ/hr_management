import '../../../../../core/base_viewmodel/base_cubit.dart';
import '../../../domain/enitites/login_type.dart';
import '../../../domain/use_cases/load_identifier_use_case.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final LoadIdentifierUseCase _loadIdentifierUseCase;

  LoginCubit(
      this._loginUseCase,
      this._loadIdentifierUseCase,
      ) : super(const LoginState()) {
    _loadSavedIdentifier();
  }

  void onIdentifierChanged(String value) {
    updateState((s) => s.copyWith(
      identifier: value,
      clearIdentifierError: true,
      clearApiError: true,
    ));
  }

  void onCountryCodeChanged(String value) {
    updateState((s) => s.copyWith(countryCode: "+$value"));
  }


  void onPasswordChanged(String value) {
    updateState((s) => s.copyWith(
      password: value,
      clearPasswordError: true,
      clearApiError: true,
    ));
  }

  void onRememberMeChanged(bool value) {
    updateState((s) => s.copyWith(rememberMe: value));
  }

  Future<void> submit(LoginType loginType) async {
    if (!_validate(loginType)) return;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoading: true,
        clearApiError: true,
      )),
      call: () => _loginUseCase(
        identifier: loginType.value == 'email'
            ? state.identifier.trim() : state.countryCode + state.identifier.trim(),
        password: state.password,
        loginType: loginType,
        isRemembered: state.rememberMe,
      ),
      onSuccess: (user) {
        updateState((s) => s.copyWith(
          isLoading: false,
          isSuccess: true,
          user: user,
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
  }

  void clearError() {
    updateState((s) => s.copyWith(
      clearApiError: true,
      clearIdentifierError: true,
      clearPasswordError: true,
    ));
  }

  Future<void> _loadSavedIdentifier() async {
    final result = await _loadIdentifierUseCase();

    result.fold(
          (failure) {
        // Silently fail - not critical
      },
          (identifier) {
        if (identifier != null && identifier.isNotEmpty) {
          updateState((s) => s.copyWith(
            savedIdentifier: identifier,
            identifier: identifier,
            rememberMe: true,
          ));
        }
      },
    );
  }

  bool _validate(LoginType loginType) {
    bool isValid = true;

    final identifier = state.identifier.trim();

    if (identifier.isEmpty) {
      updateState((s) => s.copyWith(
        identifierError: loginType == LoginType.email
            ? 'Email is required'
            : 'Phone number is required',
      ));
      isValid = false;
    } else if (loginType == LoginType.email && !_isValidEmail(identifier)) {
      updateState((s) => s.copyWith(
        identifierError: 'Please enter a valid email',
      ));
      isValid = false;
    } else if (loginType == LoginType.phone && !_isValidPhone(identifier)) {
      updateState((s) => s.copyWith(
        identifierError: 'Please enter a valid phone number',
      ));
      isValid = false;
    }

    if (state.password.isEmpty) {
      updateState((s) => s.copyWith(
        passwordError: 'Password is required',
      ));
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

  bool _isValidPhone(String phone) {
    return RegExp(r'^\d{10,15}$').hasMatch(phone);
  }
}