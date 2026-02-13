import 'package:equatable/equatable.dart';

class AttendanceDay extends Equatable {
  final int id;
  final String? date;

  final String checkInTime;
  final String checkOutTime;

  final double hoursWorked;
  final double overtimeHours;

  final String status;
  final bool hasActiveBreak;

  final String checkInLocation;
  final String proofImage;
  final String notes;

  const AttendanceDay({
    required this.id,
    required this.date,
    required this.checkInTime,
    required this.checkOutTime,
    required this.hoursWorked,
    required this.overtimeHours,
    required this.status,
    required this.hasActiveBreak,
    required this.checkInLocation,
    required this.proofImage,
    required this.notes,
  });

  @override
  List<Object?> get props => [
    id,
    date,
    checkInTime,
    checkOutTime,
    hoursWorked,
    overtimeHours,
    status,
    hasActiveBreak,
    checkInLocation,
    proofImage,
    notes,
  ];
}
