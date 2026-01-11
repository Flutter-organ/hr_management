import 'package:country_picker/country_picker.dart';
import 'package:hr_management/core/base_viewmodel/base_cubit.dart';
import 'package:hr_management/core/design_system/components/popups/sign_in_popup.dart';
import 'package:hr_management/features/auth/domain/enitites/User.dart';
import 'package:hr_management/features/auth/domain/use_cases/login_use_case.dart';
import 'package:hr_management/features/auth/presentation/login_feature/cubit/login_states.dart';

class LoginCubit extends BaseCubit<LoginStates> {
  LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitial());

  Future<void> login({
    required String identifier,
    required String password,
    required String loginType,
  }) async {
    await execute<User>(
      call: () => _loginUseCase.call(
        identifier: identifier,
        password: password,
        loginType: loginType,
      ),
      onLoading: () => emit(
        LoginLoading(
          loginType: state.loginType,
          isObscure: state.isObscure,
          countryCode: state.countryCode,
          isChecked: state.isChecked,
          isEnabled: state.isEnabled,
        ),
      ),
      onSuccess: (user) => emit(
        LoginSuccess(
          user: user,
          loginType: state.loginType,
          isObscure: state.isObscure,
          countryCode: state.countryCode,
          isChecked: state.isChecked,
          isEnabled: state.isEnabled,
        ),
      ),
      onError: (value) => emit(
        LoginFailure(
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

    emit(state.copyWith(loginType: newType));
  }

  void togglePassword() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  void changeCountryCode(Country country) {
    emit(state.copyWith(countryCode: country.phoneCode));
  }

  void isRememberd(bool value) {
    emit(state.copyWith(isChecked: value));
  }

  void filledFields(String identifier, String password) {
    emit(
      state.copyWith(
        isEnabled: (identifier.isNotEmpty && password.isNotEmpty)
            ? true
            : false,
      ),
    );
  }
}
