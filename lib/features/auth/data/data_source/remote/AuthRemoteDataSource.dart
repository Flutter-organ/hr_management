import 'package:hr_management/features/auth/data/data_source/remote/dto/ApiResponse.dart';

import '../../../domain/usecase/RegisterUseCase.dart';
import 'dto/CurrentUser.dart';

abstract class AuthRemoteDataSource {
  Future<bool> register({required RegisterParams registerParams});

  Future<ApiResponse> otp({
    required String email,
    required String code,
    required String type,
  });
}
