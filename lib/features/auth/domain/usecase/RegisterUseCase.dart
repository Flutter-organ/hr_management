import 'package:fpdart/fpdart.dart';

import '../../data/data_source/remote/dto/AuthDto.dart';
import '../failures/failure.dart';
import '../repository/auth_repository.dart';
import 'ValidationUseCase.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, AuthDto>> call({
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
     RegisterValidator.validate(
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      confirmPassword: confirmPassword,
    );

  return await repository.register(
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      confirmPassword: confirmPassword,
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