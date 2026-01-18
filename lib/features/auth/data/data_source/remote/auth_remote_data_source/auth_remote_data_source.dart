import 'package:hr_management/features/auth/data/data_source/remote/dto/ApiResponse.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResponse> login({
    required String identifier,
    required String password,
    required String loginType,
  });
}
