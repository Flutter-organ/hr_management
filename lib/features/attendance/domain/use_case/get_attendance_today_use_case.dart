import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/repository/AttendanceRepository.dart';

import '../../../auth/domain/failures/failure.dart';
import '../enitity/today_attendance.dart';

class GetTodayAttendanceUseCase {
  final AttendanceRepository attendanceRepository;

  GetTodayAttendanceUseCase(this.attendanceRepository);

  Future<Either<Failure, TodayAttendance>> call() async {
    return attendanceRepository.getTodayAttendance();
  }

}