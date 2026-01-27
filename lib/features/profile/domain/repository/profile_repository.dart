import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/employee_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, EmployeeProfile>> getProfile();

  Future<Either<Failure, EmployeeProfile>> completeProfile({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required String gender,
    required String nationalId,
    required String address,
    required int departmentId,
    required String position,
    required DateTime employmentDate,
    required double salary,
  });

  Future<Either<Failure, EmployeeProfile>> updateProfile({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required String gender,
    required String address,
    String? phone,
  });

  Future<Either<Failure, bool>> isProfileCompleted();
}