import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/employee_profile.dart';
import '../entity/gender.dart';
import '../repository/profile_repository.dart';

class CompleteProfileUseCase {
  final ProfileRepository _repository;

  const CompleteProfileUseCase(this._repository);

  Future<Either<Failure, EmployeeProfile>> call({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required Gender gender,
    required String nationalId,
    required String address,
    required int departmentId,
    required String position,
    required DateTime employmentDate,
    required double salary,
  }) {
    return _repository.completeProfile(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      gender: gender,
      nationalId: nationalId,
      address: address,
      departmentId: departmentId,
      position: position,
      employmentDate: employmentDate,
      salary: salary,
    );
  }
}