import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/payroll.dart';
import '../repository/profile_repository.dart';

class GetPayrollDetailsUseCase {
  final ProfileRepository _repository;

  const GetPayrollDetailsUseCase(this._repository);

  Future<Either<Failure, Payroll>> call(int id) {
    return _repository.getPayrollDetail(id);
  }
}