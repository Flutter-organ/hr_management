import 'package:hr_management/features/auth/presentation/sign_up_screan/verify_otp_popup/logic/verify_otp_state.dart';

import '../../../../../../core/base_viewmodel/base_cubit.dart';
import '../../../../domain/enitites/verify_otp.dart';
import '../../../../domain/usecase/OtpUseCase.dart';

class VerifyOtpCubit extends BaseCubit<VerifyOtpUiState> {
  VerifyOtpCubit(this._OTPUseCase) : super(VerifyOtpUiState());
  final verifyOTPUseCase _OTPUseCase;

  String otpCode = '';

  bool get isOtpComplete => otpCode.length == 6;

  void setOtp(String code) {
    updateState((currentState) => currentState.copyWith(code: code));
  }

  Future<void> verifyOtp({
    required String email,
    required String type,
  }) async {
    execute(
      call: () async {
        final user =  await _OTPUseCase.call(
          verifyOtp: VerifyOTP(
            identifier: email,
            code: state.code,
            type: type,
          )
        );
        return user;
      },
        onSuccess: (_) {
          updateState((currentState) => currentState.copyWith(isVerified: true));
          },

        onError: (error) {
        updateState((currentState) => currentState.copyWith(errorMessage: error.message));
      }
    );

  }

  void resendOtp() {}
}
