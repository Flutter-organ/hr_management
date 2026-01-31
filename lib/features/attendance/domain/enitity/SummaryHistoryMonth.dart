import 'package:equatable/equatable.dart';

class SummaryHistoryMonth extends Equatable {
  final num totalDays;
  final num presentDays;
  final num lateDays;
  final num absentDays;
  final num totalHours;
  final num overtimeHours;

  const SummaryHistoryMonth({
    required this.totalDays,
    required this.presentDays,
    required this.lateDays,
    required this.absentDays,
    required this.totalHours,
    required this.overtimeHours,
  });

  @override
  List<Object?> get props => [
    totalDays,
    presentDays,
    lateDays,
    absentDays,
    totalHours,
    overtimeHours,
  ];
}
