import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/profile/domain/entity/gender.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/employee_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, EmployeeProfile>> getProfile();

  Future<Either<Failure, EmployeeProfile>> completeProfile({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required Gender gender,
    required String nationalId,
    required String address,
    // required int departmentId,
    // required String position,
    // required DateTime employmentDate,
    // required double salary,
  });

  Future<Either<Failure, EmployeeProfile>> updateProfile({
    String? firstName,
    String? lastName,
    String? phone,
    String? address,
    String? avatarPath,
  });

  Future<Either<Failure, bool>> isProfileCompleted();

  Future<Either<Failure, String>> uploadProfileImage(String filePath);
}