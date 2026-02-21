import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/profile/domain/entity/office_asset.dart';
import 'package:hr_management/features/profile/domain/entity/payroll.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/employee_profile.dart';
import '../../domain/entity/gender.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasource/local/profile_local_data_source.dart';
import '../datasource/remote/profile_remote_data_source.dart';
import '../mapper/payroll_mapper.dart';
import '../mapper/profile_failure_mapper.dart';
import '../mapper/profile_mapper.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final ProfileLocalDataSource _localDataSource;

  const ProfileRepositoryImpl({
    required ProfileRemoteDataSource remoteDataSource,
    required ProfileLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Either<Failure, EmployeeProfile>> getProfile() async {
    try {
      final profileDto = await _remoteDataSource.getProfile();
      final profile = ProfileMapper.toDomain(profileDto);

      await _localDataSource.cacheProfile(profileDto);
      await _localDataSource.setProfileCompleted(profile.isProfileComplete);

      return Right(profile);
    } catch (e) {
      return Left(ProfileFailureMapper.mapException(e));
    }
  }

  @override
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
  }) async {
    try {
      final request = ProfileMapper.toCompleteProfileRequestDto(
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        gender: gender.name,
        nationalId: nationalId,
        address: address,
        // departmentId: departmentId,
        // position: position,
        // employmentDate: employmentDate,
        // salary: salary,
      );

      final profileDto = await _remoteDataSource.completeProfile(request);
      final profile = ProfileMapper.toDomain(profileDto);

      await _localDataSource.cacheProfile(profileDto);
      await _localDataSource.setProfileCompleted(true);

      return Right(profile);
    } catch (e) {
      return Left(ProfileFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, EmployeeProfile>> updateProfile({
    String? firstName,
    String? lastName,
    String? phone,
    String? address,
    String? avatarPath,
  }) async {
    try {
      final request = ProfileMapper.toUpdateProfileRequestDto(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        address: address,
      );

      final profileDto = await _remoteDataSource.updateProfile(
        request: request,
        avatarPath: avatarPath,
      );

      final profile = ProfileMapper.toDomain(profileDto);

      await _localDataSource.cacheProfile(profileDto);

      return Right(profile);
    } catch (e) {
      return Left(ProfileFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> isProfileCompleted() async {
    try {
      final isCompleted = await _localDataSource.isProfileCompleted();
      return Right(isCompleted);
    } catch (e) {
      return Left(ProfileFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfileImage(String filePath) async {
    try {
      final response = await _remoteDataSource.uploadProfileImage(filePath);
      return Right(response.url);
    } catch (e) {
      return Left(ProfileFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, Payroll>> getPayrollDetail(int id) async {
    try {
      final dto = await _remoteDataSource.getPayrollDetail(id);
      return Right(PayrollMapper.toDomain(dto));
    } catch (e) {
      return Left(ProfileFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<Payroll>>> getPayrollHistory() async {
    try {
      final response = await _remoteDataSource.getPayrollHistory();
      final domain = response.map((e) => PayrollMapper.toDomain(e)).toList();
      return Right(domain);
    } catch (e) {
      return Left(ProfileFailureMapper.mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<OfficeAsset>>> getOfficeAssets() async {
    try {
      // TODO: Replace with remote data source when backend is ready
      // final assets = await _remoteDataSource.getOfficeAssets();
      final assets = await _localDataSource.getOfficeAssets();
      return Right(assets);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

}