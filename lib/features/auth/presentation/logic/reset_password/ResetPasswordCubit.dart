import 'package:hr_management/features/auth/presentation/logic/reset_password/reset_password_state.dart';
import '../../../../../core/base_viewmodel/base_cubit.dart';
import '../../../domain/usecases/ResetPasswordUseCase.dart';

class ResetPasswordCubit extends BaseCubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(this._resetPasswordUseCase)
      : super(const ResetPasswordInitial());

  Future<void> resetPassword({
    required String identifier,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    await execute(
      onLoading: () => emit(const ResetPasswordLoading()),
      call: () => _resetPasswordUseCase(
        identifier: identifier,
        code: code,
        password: password,
        passwordConfirmation: passwordConfirmation,
      ),
      onSuccess: (user) => emit(ResetPasswordSuccess(user)),
      onError: (error) => emit(ResetPasswordError(error)),
    );
  }

  void reset() {
    emit(const ResetPasswordInitial());
  }
}