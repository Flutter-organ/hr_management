class SummaryHistoryMonthDto {
  SummaryHistoryMonthDto({
      num? totalDays, 
      num? presentDays, 
      num? lateDays, 
      num? absentDays, 
      num? totalHours, 
      num? overtimeHours,}){
    _totalDays = totalDays;
    _presentDays = presentDays;
    _lateDays = lateDays;
    _absentDays = absentDays;
    _totalHours = totalHours;
    _overtimeHours = overtimeHours;
}

  SummaryHistoryMonthDto.fromJson(dynamic json) {
    _totalDays = json['total_days'];
    _presentDays = json['present_days'];
    _lateDays = json['late_days'];
    _absentDays = json['absent_days'];
    _totalHours = json['total_hours'];
    _overtimeHours = json['overtime_hours'];
  }
  num? _totalDays;
  num? _presentDays;
  num? _lateDays;
  num? _absentDays;
  num? _totalHours;
  num? _overtimeHours;

  num? get totalDays => _totalDays;
  num? get presentDays => _presentDays;
  num? get lateDays => _lateDays;
  num? get absentDays => _absentDays;
  num? get totalHours => _totalHours;
  num? get overtimeHours => _overtimeHours;
}