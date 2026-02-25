// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryAttendanceResponse _$HistoryAttendanceResponseFromJson(
  Map<String, dynamic> json,
) => _HistoryAttendanceResponse(
  summary: json['summary'] == null
      ? null
      : SummaryResponse.fromJson(json['summary'] as Map<String, dynamic>),
  month: (json['month'] as num?)?.toInt(),
  year: (json['year'] as num?)?.toInt(),
  dayResponse: (json['records'] as List<dynamic>?)
      ?.map((e) => DayResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HistoryAttendanceResponseToJson(
  _HistoryAttendanceResponse instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'month': instance.month,
  'year': instance.year,
  'records': instance.dayResponse,
};

_DayResponse _$DayResponseFromJson(Map<String, dynamic> json) => _DayResponse(
  id: (json['id'] as num?)?.toInt(),
  date: json['date'] as String?,
  proofImage: json['proof_image'] as String?,
  notes: json['notes'] as String?,
  totalBreakHours: json['total_break_hours'] as num?,
  overtimeHours: json['overtime_hours'] as String?,
  checkInTime: json['check_in_time'] as String?,
  checkOutTime: json['check_out_time'] as String?,
  createdAt: json['created_at'] as String?,
  checkInLocation: json['check_in_location'] as String?,
  checkOutLocation: json['check_out_location'] as String?,
  updatedAt: json['updated_at'] as String?,
  hoursWorked: json['hours_worked'] as String?,
  hasActiveBreak: json['has_active_break'] as bool?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$DayResponseToJson(_DayResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'proof_image': instance.proofImage,
      'notes': instance.notes,
      'total_break_hours': instance.totalBreakHours,
      'overtime_hours': instance.overtimeHours,
      'check_in_time': instance.checkInTime,
      'check_out_time': instance.checkOutTime,
      'created_at': instance.createdAt,
      'check_in_location': instance.checkInLocation,
      'check_out_location': instance.checkOutLocation,
      'updated_at': instance.updatedAt,
      'hours_worked': instance.hoursWorked,
      'has_active_break': instance.hasActiveBreak,
      'status': instance.status,
    };

_SummaryResponse _$SummaryResponseFromJson(Map<String, dynamic> json) =>
    _SummaryResponse(
      overtimeHours: json['overtime_hours'] as num?,
      lateDays: (json['late_days'] as num?)?.toInt(),
      presentDays: (json['present_days'] as num?)?.toInt(),
      totalHours: json['total_hours'] as num?,
      totalDays: (json['total_days'] as num?)?.toInt(),
      absentDays: (json['absent_days'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SummaryResponseToJson(_SummaryResponse instance) =>
    <String, dynamic>{
      'overtime_hours': instance.overtimeHours,
      'late_days': instance.lateDays,
      'present_days': instance.presentDays,
      'total_hours': instance.totalHours,
      'total_days': instance.totalDays,
      'absent_days': instance.absentDays,
    };
