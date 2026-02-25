import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/enitity/attendanceclockIn.dart';

import '../../../auth/domain/failures/failure.dart';
import '../../domain/enitity/history_attendance.dart';
import '../../domain/enitity/today_attendance.dart';
import '../../domain/repository/AttendanceRepository.dart';
import '../data_source/remote/attendance_remote_data_source.dart';
import '../mappers/attendance_mapper.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource _attendanceRemoteDataSource;

  const AttendanceRepositoryImpl({
    required AttendanceRemoteDataSource attendanceRemoteDataSource,
  }) : _attendanceRemoteDataSource = attendanceRemoteDataSource;

  @override
  Future<Either<Failure, HistoryAttendance>> attendanceHistory() async {
    try {
      final attendanceHistoryResponse = await _attendanceRemoteDataSource
          .attendanceHistory();
      return Right( AttendanceMapper.toDomainAttendanceHistory(
        attendanceHistoryResponse
      ));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TodayAttendance>> getTodayAttendance() async {
    try {
      final todayAttendanceResponse = await _attendanceRemoteDataSource.attendanceToday();
        return Right(AttendanceMapper.toDomainTodayAttendance(todayAttendanceResponse));
    } on Exception catch (e) {
     return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> clockInAttendance({
    required ClockInAttendance clockInAttendance,
  }) async {
    try {
      final isClockIn = await _attendanceRemoteDataSource.clockInAttendance(
        AttendanceMapper.toDtoAttendanceClockInRequest(clockInAttendance),
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
