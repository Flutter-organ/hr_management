import 'package:equatable/equatable.dart';

class Payroll extends Equatable {
  final int id;
  final String yearMonth;
  final double baseSalary;
  final double overtimePay;
  final double deductions;
  final double netSalary;
  final String status;
  final DateTime? paidAt;

  // Additional fields for detailed view
  final double? tax;
  final double? bonus;
  final double? reimbursement;
  final double? totalHours;
  final double? overtimeHours;
  final DateTime? periodStart;
  final DateTime? periodEnd;

  static const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'
  ];

  const Payroll({
    required this.id,
    required this.yearMonth,
    required this.baseSalary,
    required this.overtimePay,
    required this.deductions,
    required this.netSalary,
    required this.status,
    this.paidAt,
    this.tax,
    this.bonus,
    this.reimbursement,
    this.totalHours,
    this.overtimeHours,
    this.periodStart,
    this.periodEnd,
  });

  /// Formatted month display: "2024-12" → "Dec 2024"
  String get formattedYearMonth {
    try {
      final parts = yearMonth.split('-');
      if (parts.length != 2) return yearMonth;

      final year = int.parse(parts[0]);
      final monthNum = int.parse(parts[1]);
      final date = DateTime(year, monthNum);

      return '${months[date.month - 1]} ${date.year}';
    } catch (e) {
      return yearMonth;
    }
  }

  /// Formatted paid date: "30 Sept 2024"
  String get formattedPaidDate {
    if (paidAt == null) return '-';

    return '${paidAt!.day} ${months[paidAt!.month - 1]} ${paidAt!.year}';
  }

  /// Formatted salary: "$5,100.00"
  String get formattedNetSalary => '\$${netSalary.toStringAsFixed(2)}';

  String get formattedBaseSalary => '\$${baseSalary.toStringAsFixed(2)}';

  String get formattedOvertimePay => '\$${overtimePay.toStringAsFixed(2)}';

  String get formattedDeductions => '\$${deductions.toStringAsFixed(2)}';

  /// Formatted total hours: "40:00 Hrs"
  String get formattedTotalHours {
    if (totalHours == null) return '00:00 Hrs';
    final hours = totalHours!.floor();
    final minutes = ((totalHours! - hours) * 60).round();
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} Hrs';
  }

  String get formattedOvertimeHours {
    if (overtimeHours == null) return '00:00 Hrs';
    final hours = overtimeHours!.floor();
    final minutes = ((overtimeHours! - hours) * 60).round();
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} Hrs';
  }

  /// Paid period string: "1 Sept 2024 - 30 Sept 2024"
  String get formattedPaidPeriod {
    if (periodStart == null || periodEnd == null) {
      // Derive from month if not provided
      try {
        final parts = yearMonth.split('-');
        final year = int.parse(parts[0]);
        final monthNum = int.parse(parts[1]);
        final start = DateTime(year, monthNum, 1);
        final end = DateTime(year, monthNum + 1, 0);

        return '${start.day} ${months[start.month - 1]} ${start.year} - ${end.day} ${months[end.month - 1]} ${end.year}';
      } catch (e) {
        return 'N/A';
      }
    }

    return '${periodStart!.day} ${months[periodStart!.month - 1]} ${periodStart!.year} - '
        '${periodEnd!.day} ${months[periodEnd!.month - 1]} ${periodEnd!.year}';
  }

  bool get isPaid => status.toLowerCase() == 'paid';

  bool get isPending => status.toLowerCase() == 'pending';

  @override
  List<Object?> get props => [
    id,
    yearMonth,
    baseSalary,
    overtimePay,
    deductions,
    netSalary,
    status,
    paidAt,
    tax,
    bonus,
    reimbursement,
    totalHours,
    overtimeHours,
    periodStart,
    periodEnd,
  ];
}