import 'package:fpdart/fpdart.dart';
import 'package:hr_management/features/attendance/domain/repository/AttendanceRepository.dart';

import '../../../auth/domain/failures/failure.dart';

class StartAttendanceBreakUseCase {
  final AttendanceRepository attendanceRepository;

  StartAttendanceBreakUseCase({required this.attendanceRepository});

  Future<Either<Failure, bool>> call() async {
   return await attendanceRepository.startAttendanceBreak();
  }
}
