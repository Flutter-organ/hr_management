class HistoryAttendance {
  final int month;
  final int year;
  final List<Day> days;
  final Summary summary;

  const HistoryAttendance({
    required this.month,
    required this.year,
    required this.days,
    required this.summary,
  });
}

class Day {
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

  const Day({
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

class Summary {
  final num overtimeHours;
  final int lateDays;
  final int presentDays;
  final num totalHours;
  final int totalDays;
  final int absentDays;

  const Summary({
    required this.overtimeHours,
    required this.lateDays,
    required this.presentDays,
    required this.totalHours,
    required this.totalDays,
    required this.absentDays,
  });
}
