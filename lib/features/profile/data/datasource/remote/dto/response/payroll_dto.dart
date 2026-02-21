class PayrollDto {
  final int? id;
  final String? month;
  final double? baseSalary;
  final double? overtimePay;
  final double? deductions;
  final double? netSalary;
  final String? status;
  final String? paidAt;

  // Additional fields (if backend provides)
  final double? tax;
  final double? bonus;
  final double? reimbursement;
  final double? totalHours;
  final double? overtimeHours;
  final String? periodStart;
  final String? periodEnd;

  const PayrollDto({
    this.id,
    this.month,
    this.baseSalary,
    this.overtimePay,
    this.deductions,
    this.netSalary,
    this.status,
    this.paidAt,
    this.tax,
    this.bonus,
    this.reimbursement,
    this.totalHours,
    this.overtimeHours,
    this.periodStart,
    this.periodEnd,
  });

  factory PayrollDto.fromJson(Map<String, dynamic> json) {
    return PayrollDto(
      id: json['id'] as int?,
      month: json['month'] as String?,
      baseSalary: (json['base_salary'] as num?)?.toDouble(),
      overtimePay: (json['overtime_pay'] as num?)?.toDouble(),
      deductions: (json['deductions'] as num?)?.toDouble(),
      netSalary: (json['net_salary'] as num?)?.toDouble(),
      status: json['status'] as String?,
      paidAt: json['paid_at'] as String?,
      tax: (json['tax'] as num?)?.toDouble(),
      bonus: (json['bonus'] as num?)?.toDouble(),
      reimbursement: (json['reimbursement'] as num?)?.toDouble(),
      totalHours: (json['total_hours'] as num?)?.toDouble(),
      overtimeHours: (json['overtime_hours'] as num?)?.toDouble(),
      periodStart: json['period_start'] as String?,
      periodEnd: json['period_end'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'month': month,
      'base_salary': baseSalary,
      'overtime_pay': overtimePay,
      'deductions': deductions,
      'net_salary': netSalary,
      'status': status,
      'paid_at': paidAt,
      'tax': tax,
      'bonus': bonus,
      'reimbursement': reimbursement,
      'total_hours': totalHours,
      'overtime_hours': overtimeHours,
      'period_start': periodStart,
      'period_end': periodEnd,
    };
  }
}