import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/enitity/AttendanceHistoryDays.dart';
import 'package:hr_management/features/attendance/domain/repository/AttendanceRepository.dart';

import '../../../auth/domain/failures/failure.dart';

class GetTodayAttendanceUseCase {
  final AttendanceRepository attendanceRepository;

  GetTodayAttendanceUseCase(this.attendanceRepository);

  Future<Either<Failure,AttendanceDay>> call() async {
    return attendanceRepository.getAttendanceToday();
  }

}