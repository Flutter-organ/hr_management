import 'package:fpdart/fpdart.dart';

import '../../data/data_source/remote/dto/AuthDto.dart';
import '../failures/failure.dart';
import '../repository/auth_repository.dart';
import 'ValidationUseCase.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, bool>> call({
   required RegisterParams registerParams,
  }) async {

  return await repository.register(
    registerParams: registerParams,
    );
  }
}
class RegisterParams{
  final String email;
  final String password;
  final String PhoneNumber;
  final String confirmPassword;


  RegisterParams({
    required this.email,
    required this.PhoneNumber,
    required this.password,
    required this.confirmPassword,
  });
}