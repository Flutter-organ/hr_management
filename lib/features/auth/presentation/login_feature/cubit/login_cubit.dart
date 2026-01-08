import 'package:hr_management/core/base_viewmodel/base_cubit.dart';
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
      onLoading: () => emit(LoginLoading()),
      onSuccess: (user) => emit(LoginSuccess(user: user)),
      onError: (value) => emit(LoginFailure(message: value.message)),
    );
  }
}
