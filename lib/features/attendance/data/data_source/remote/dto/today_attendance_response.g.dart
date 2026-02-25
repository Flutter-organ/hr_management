// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodayAttendanceResponse _$TodayAttendanceResponseFromJson(
  Map<String, dynamic> json,
) => _TodayAttendanceResponse(
  id: (json['id'] as num?)?.toInt(),
  date: json['date'] as String?,
  checkInTime: json['check_in_time'] as String?,
  checkOutTime: json['check_out_time'] as String?,
  checkInLocation: json['check_in_location'] as String?,
  checkOutLocation: json['check_out_location'] as String?,
  proofImage: json['proof_image'] as String?,
  notes: json['notes'] as String?,
  totalBreakHours: json['total_break_hours'] as num?,
  overtimeHours: json['overtime_hours'] as String?,
  hoursWorked: json['hours_worked'] as String?,
  status: json['status'] as String?,
  hasActiveBreak: json['has_active_break'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$TodayAttendanceResponseToJson(
  _TodayAttendanceResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date,
  'check_in_time': instance.checkInTime,
  'check_out_time': instance.checkOutTime,
  'check_in_location': instance.checkInLocation,
  'check_out_location': instance.checkOutLocation,
  'proof_image': instance.proofImage,
  'notes': instance.notes,
  'total_break_hours': instance.totalBreakHours,
  'overtime_hours': instance.overtimeHours,
  'hours_worked': instance.hoursWorked,
  'status': instance.status,
  'has_active_break': instance.hasActiveBreak,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
