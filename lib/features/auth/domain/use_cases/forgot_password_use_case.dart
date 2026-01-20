import 'package:fpdart/fpdart.dart';

import '../enitites/auth_type.dart';
import '../failures/failure.dart';
import '../repository/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository _repository;

  const ForgotPasswordUseCase(this._repository);


  Future<Either<Failure, String>> call({
    required String identifier,
    required AuthType loginType,
  }) {
    return _repository.forgotPassword(
      identifier: identifier,
      loginType: loginType,
    );
  }
}