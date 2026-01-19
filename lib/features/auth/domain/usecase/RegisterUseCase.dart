import 'package:fpdart/fpdart.dart';

import '../../data/data_source/remote/dto/AuthDto.dart';
import '../enitites/Register.dart';
import '../failures/failure.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, bool>> call({
   required Register register,
  }) async {

  return await repository.register(
    register: register,
    );
  }
}