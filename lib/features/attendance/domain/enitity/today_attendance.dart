class TodayAttendance {
  final String date;
  final String proofImage;
  final String notes;
  final num totalBreakHours;
  final String overtimeHours;
  final String checkInTime;
  final String checkOutTime;
  final String createdAt;
  final String checkInLocation;
  final String checkOutLocation;
  final String updatedAt;
  final String hoursWorked;
  final int id;
  final bool hasActiveBreak;
  final String status;

  const TodayAttendance({
    required this.date,
    required this.proofImage,
    required this.notes,
    required this.totalBreakHours,
    required this.overtimeHours,
    required this.checkInTime,
    required this.checkOutTime,
    required this.createdAt,
    required this.checkInLocation,
    required this.checkOutLocation,
    required this.updatedAt,
    required this.hoursWorked,
    required this.id,
    required this.hasActiveBreak,
    required this.status,
  });
}
