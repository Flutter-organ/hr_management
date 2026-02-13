import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/enitity/AttendanceHistory.dart';
import 'package:hr_management/features/attendance/domain/enitity/AttendanceHistoryDays.dart';
import 'package:hr_management/features/attendance/domain/enitity/attendanceclockIn.dart';

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

  @override
  Future<Either<Failure, AttendanceDay>> getAttendanceToday() async {
    final attendanceToday = await _attendanceRemoteDataSource.attendanceToday();
    return Right(AttendanceMapper.toDomainAttendanceDay(attendanceToday));
  }

  @override
  Future<Either<Failure, bool>> attendanceClockIn({
    required AttendanceClockIn attendanceClockIn,
  }) async {
    try {
      final isClockIn = await _attendanceRemoteDataSource.attendanceClockIn(
        AttendanceMapper.toDtoAttendanceClockInRequest(attendanceClockIn),
      );
      return Right(isClockIn);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> attendanceClockOut() async {
    try {
      final isClockOut = await _attendanceRemoteDataSource.attendanceClockOut();
      return Right(isClockOut);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> endAttendanceBreak() async{
    final isEndBreak = await _attendanceRemoteDataSource.endAttendanceBreak();
    return Right(isEndBreak);
  }

  @override
  Future<Either<Failure, bool>> startAttendanceBreak() async{
   try {
     final isStartBreak = await _attendanceRemoteDataSource.startAttendanceBreak();
      return Right(isStartBreak);
   } on Exception catch (e) {
     return Left(ServerFailure(e.toString()));
   }
  }
}
