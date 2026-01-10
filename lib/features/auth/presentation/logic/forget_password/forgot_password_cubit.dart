import '../../../../../core/base_viewmodel/base_cubit.dart';
import '../../../domain/enitites/login_type.dart';
import '../../../domain/usecases/ForgotPasswordUseCase.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends BaseCubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordCubit(this._forgotPasswordUseCase)
      : super(const ForgotPasswordInitial());

  String? _identifier;
  LoginType? _loginType;

  String? get identifier => _identifier;
  LoginType? get loginType => _loginType;

  Future<void> forgotPassword({
    required String identifier,
    required LoginType loginType,
  }) async {
    await execute(
      onLoading: () => emit(const ForgotPasswordLoading()),
      call: () => _forgotPasswordUseCase(
        identifier: identifier,
        loginType: loginType,
      ),
      onSuccess: (identifier) {
        _identifier = identifier;
        _loginType = loginType;
        emit(ForgotPasswordSuccess(identifier));
      },
      onError: (error) => emit(ForgotPasswordError(error)),
    );
  }

  Future<void> resendOtp() async {
    if (_identifier == null || _loginType == null) return;

    await forgotPassword(
      identifier: _identifier!,
      loginType: _loginType!,
    );
  }

  void reset() {
    _identifier = null;
    _loginType = null;
    emit(const ForgotPasswordInitial());
  }
}