import '../../../../core/data/util/parsing.dart';
import '../../domain/entity/payroll.dart';
import '../datasource/remote/dto/payroll_dto.dart';

class PayrollMapper {
  PayrollMapper._();

  static Payroll toDomain(PayrollDto dto) {
    return Payroll(
      id: dto.id ?? 0,
      yearMonth: dto.month ?? '',
      baseSalary: dto.baseSalary ?? 0.0,
      overtimePay: dto.overtimePay ?? 0.0,
      deductions: dto.deductions ?? 0.0,
      netSalary: dto.netSalary ?? 0.0,
      status: dto.status ?? 'pending',
      paidAt: DataFormat.parseDate(dto.paidAt),
      tax: dto.tax,
      bonus: dto.bonus,
      reimbursement: dto.reimbursement,
      totalHours: dto.totalHours,
      overtimeHours: dto.overtimeHours,
      periodStart: DataFormat.parseDate(dto.periodStart),
      periodEnd: DataFormat.parseDate(dto.periodEnd),
    );
  }

  static List<Payroll> toDomainList(List<PayrollDto> dtos) {
    return dtos.map((dto) => toDomain(dto)).toList();
  }
}