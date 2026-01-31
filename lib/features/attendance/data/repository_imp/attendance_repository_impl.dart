import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/enitity/AttendanceHistory.dart';

import '../../../auth/domain/failures/failure.dart';
import '../../domain/repository/AttendanceRepository.dart';
import '../data_source/remote/attendance_remote_data_source.dart';
import '../mappers/AttendanceMapper.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource _attendanceRemoteDataSource;

  const AttendanceRepositoryImpl({
    required AttendanceRemoteDataSource attendanceRemoteDataSource,
  }) : _attendanceRemoteDataSource = attendanceRemoteDataSource;

  @override
  Future<Either<Failure, AttendanceHistory>> attendanceHistory() async {
    try {
      final attendanceHistoryResponse = _attendanceRemoteDataSource
          .attendanceHistory();
      final attendanceHistory = AttendanceMapper.toDomainAttendanceHistory(
        await attendanceHistoryResponse,
      );
      return Right(attendanceHistory);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
