class SummaryHistoryMonthDto {
  final num totalDays;
  final num presentDays;
  final num lateDays;
  final num absentDays;
  final num totalHours;
  final num overtimeHours;

  SummaryHistoryMonthDto({
    required this.totalDays,
    required this.presentDays,
    required this.lateDays,
    required this.absentDays,
    required this.totalHours,
    required this.overtimeHours,
  });

  factory SummaryHistoryMonthDto.fromJson(Map<String, dynamic> json) {
    return SummaryHistoryMonthDto(
      totalDays: json['total_days'],
      presentDays: json['present_days'],
      lateDays: json['late_days'],
      absentDays: json['absent_days'],
      totalHours: json['total_hours'],
      overtimeHours: json['overtime_hours'],
    );
  }
}
