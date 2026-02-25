import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_attendance_response.freezed.dart';
part 'history_attendance_response.g.dart';

@freezed
abstract class  HistoryAttendanceResponse with _$HistoryAttendanceResponse {
  const factory HistoryAttendanceResponse({
    @JsonKey(name: "summary")
    SummaryResponse? summary,
    @JsonKey(name: "month")
    int? month,

    @JsonKey(name: "year")
    int? year,
    @JsonKey(name: "records")
    List<DayResponse>? dayResponse,
  }) = _HistoryAttendanceResponse;

  factory HistoryAttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryAttendanceResponseFromJson(json);
}

@freezed
abstract class DayResponse with _$DayResponse {
  const factory DayResponse({
    @JsonKey(name: "id")
    int? id,

    @JsonKey(name: "date")
    String? date,

    @JsonKey(name: "proof_image")
    String? proofImage,

    @JsonKey(name: "notes")
    String? notes,

    @JsonKey(name: "total_break_hours")
    num? totalBreakHours,

    @JsonKey(name: "overtime_hours")
    String? overtimeHours,

    @JsonKey(name: "check_in_time")
    String? checkInTime,

    @JsonKey(name: "check_out_time")
    String? checkOutTime,

    @JsonKey(name: "created_at")
    String? createdAt,

    @JsonKey(name: "check_in_location")
    String? checkInLocation,

    @JsonKey(name: "check_out_location")
    String? checkOutLocation,

    @JsonKey(name: "updated_at")
    String? updatedAt,

    @JsonKey(name: "hours_worked")
    String? hoursWorked,

    @JsonKey(name: "has_active_break")
    bool? hasActiveBreak,

    @JsonKey(name: "status")
    String? status,
  }) = _DayResponse;

  factory DayResponse.fromJson(Map<String, dynamic> json) =>
      _$DayResponseFromJson(json);
}

@freezed
abstract class SummaryResponse with _$SummaryResponse {
  const factory SummaryResponse({
    @JsonKey(name: "overtime_hours")
    num? overtimeHours,

    @JsonKey(name: "late_days")
    int? lateDays,

    @JsonKey(name: "present_days")
    int? presentDays,

    @JsonKey(name: "total_hours")
    num? totalHours,

    @JsonKey(name: "total_days")
    int? totalDays,

    @JsonKey(name: "absent_days")
    int? absentDays,
  }) = _SummaryResponse;

  factory SummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$SummaryResponseFromJson(json);
}
