import 'package:equatable/equatable.dart';

class AttendanceHistoryDays extends Equatable {
  final num id;
  final String date;
  final String checkInTime;
  final dynamic checkInLocation;
  final dynamic checkOutTime;
  final dynamic checkOutLocation;
  final String hoursWorked;
  final String overtimeHours;
  final String status;
  final String notes;
  final String createdAt;
  final String updatedAt;

  const AttendanceHistoryDays({
    required this.id,
    required this.date,
    required this.checkInTime,
    required this.checkInLocation,
    required this.checkOutTime,
    required this.checkOutLocation,
    required this.hoursWorked,
    required this.overtimeHours,
    required this.status,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    date,
    checkInTime,
    checkInLocation,
    checkOutTime,
    checkOutLocation,
    hoursWorked,
    overtimeHours,
    status,
    notes,
    createdAt,
    updatedAt,
  ];
}
