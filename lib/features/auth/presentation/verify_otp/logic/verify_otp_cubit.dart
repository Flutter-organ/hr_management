import '../../../../../core/base_viewmodel/base_cubit.dart';
import '../../../domain/usecase/OtpUseCase.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends BaseCubit<VerifyOtpState> {
  VerifyOtpCubit(this._OTPUseCase) : super(VerifyOtpInitial());
  final OtpUseCase _OTPUseCase;

  String otpCode = '';

  bool get isOtpComplete => otpCode.length == 6;

  void setOtp(String code) {
    otpCode = code;
    emit(VerifyOtpCodeChanged(code));
  }

  Future<void> verifyOtp({
    required String email,
    required String type,
  }) async {
    execute(
      call: () async {
        final user =  _OTPUseCase.call(
          email: email,
          code: otpCode,
          type: type,
        );
        return user;
      },
      onSuccess: (_) => emit(VerifyOtpSuccess()),
      onError: (error) => emit(VerifyOtpFailure(message: error.message))
    );

  }

  void resendOtp() {
    emit(VerifyOtpResent());
  }
}
