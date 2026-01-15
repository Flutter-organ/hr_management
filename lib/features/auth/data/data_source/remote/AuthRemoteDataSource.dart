import 'package:hr_management/features/auth/data/data_source/remote/dto/ApiResponse.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/register_dto_request.dart';
import 'package:hr_management/features/auth/data/data_source/remote/dto/verify_otp_dto.dart';

import '../../../domain/usecase/RegisterUseCase.dart';
import 'dto/CurrentUser.dart';
import 'dto/OtpVerifyResponse.dart';

abstract class AuthRemoteDataSource {
  Future<bool> register({required RegisterDtoRequest registerDtoRequest});

  Future<OtpVerifyResponse> verifyOTP({
    required VerifyOtpDto verifyOtpDto,
  });
}
