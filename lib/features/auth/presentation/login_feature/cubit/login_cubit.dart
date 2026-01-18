import 'package:country_picker/country_picker.dart';
import 'package:hr_management/core/base_viewmodel/base_cubit.dart';
import 'package:hr_management/core/design_system/components/popups/sign_in_popup.dart';
import 'package:hr_management/features/auth/domain/use_cases/load_identifier_use_case.dart';
import 'package:hr_management/features/auth/domain/use_cases/login_use_case.dart';
import 'package:hr_management/features/auth/presentation/login_feature/cubit/login_states.dart';

class LoginCubit extends BaseCubit<LoginStates> {
  LoginUseCase _loginUseCase;
  LoadIdentifierUseCase _loadIdentifierUseCase;

  LoginCubit(this._loginUseCase, this._loadIdentifierUseCase)
    : super(LoginInitial());

  Future<void> login({
    required String identifier,
    required String password,
    required String loginType,
    required bool isRememberd,
  }) async {
    await execute(
      call: () => _loginUseCase.call(
        identifier: identifier,
        password: password,
        loginType: loginType,
        isRememberd: state.isChecked,
      ),
      onLoading: () => updateState(
        (currentState) => LoginLoading(
          loginType: state.loginType,
          isChecked: state.isChecked,
          isObscure: state.isObscure,
          countryCode: state.countryCode,
          isEnabled: state.isEnabled,
        ),
      ),
      onSuccess: (user) => updateState(
        (currentState) => LoginSuccess(
          user: user,
          loginType: state.loginType,
          isChecked: state.isChecked,
          isEnabled: state.isEnabled,
        ),
      ),
      onError: (value) => updateState(
        (currentState) => LoginFailure(
          message: value.message,
          loginType: state.loginType,
          isObscure: state.isObscure,
          countryCode: state.countryCode,
          isChecked: state.isChecked,
          isEnabled: state.isEnabled,
        ),
      ),
    );
  }

  void toggleLogintype() {
    final newType = state.loginType == LoginType.email
        ? LoginType.phone
        : LoginType.email;

    updateState((currentState) => state.copyWith(loginType: newType));
  }

  void togglePassword() {
    updateState((currentState) => state.copyWith(isObscure: !state.isObscure));
  }

  void changeCountryCode(Country country) {
    updateState(
      (currentState) => state.copyWith(countryCode: country.phoneCode),
    );
  }

  void isRememberd(bool value) {
    updateState((currentState) => state.copyWith(isChecked: value));
  }

  void filledFields(String identifier, String password) {
    updateState(
      (currentState) => state.copyWith(
        isEnabled: (identifier.isNotEmpty && password.isNotEmpty)
            ? true
            : false,
      ),
    );
  }

  Future<void> loadSavedCredentials() async {
    final result = await _loadIdentifierUseCase.getIdentifier();

    result.fold((l) => null, (mail) {
      if (mail != null && mail.isNotEmpty) {
        updateState(
          (currentState) => state.copyWith(
            isChecked: true,
            identifier: mail,
            loginType: mail.contains('@') ? LoginType.email : LoginType.phone,
          ),
        );
      }
    });
  }
}
