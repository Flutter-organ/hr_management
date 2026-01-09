import '../../../../../core/base_viewmodel/base_cubit.dart';
import '../../../domain/enitites/login_type.dart';
import '../../../domain/usecases/ForgotPasswordUseCase.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends BaseCubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordCubit(this._forgotPasswordUseCase)
      : super(ForgotPasswordInitial());

  String? _identifier;
  String? get identifier => _identifier;

  Future<void> forgotPassword({required String email}) async {
    await execute(
      onLoading: () => emit(ForgotPasswordLoading()),
      call: () => _forgotPasswordUseCase(
        identifier: email,
        loginType: LoginType.email,
      ),
      onSuccess: (identifier) {
        _identifier = identifier;
        emit(ForgotPasswordSuccess(identifier));
      },
      onError: (error) => emit(ForgotPasswordError(error)),
    );
  }

  void reset() {
    _identifier = null;
    emit(ForgotPasswordInitial());
  }
}