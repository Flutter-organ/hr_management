import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_attendance_response.freezed.dart';
part 'today_attendance_response.g.dart';

@freezed
abstract class TodayAttendanceResponse with _$TodayAttendanceResponse {
  const factory TodayAttendanceResponse({
    @JsonKey(name: "id")
    int? id,

    @JsonKey(name: "date")
    String? date,

    @JsonKey(name: "check_in_time")
    String? checkInTime,

    @JsonKey(name: "check_out_time")
    String? checkOutTime,

    @JsonKey(name: "check_in_location")
    String? checkInLocation,

    @JsonKey(name: "check_out_location")
    String? checkOutLocation,

    @JsonKey(name: "proof_image")
    String? proofImage,

    @JsonKey(name: "notes")
    String? notes,

    @JsonKey(name: "total_break_hours")
    num? totalBreakHours,

    @JsonKey(name: "overtime_hours")
    String? overtimeHours,

    @JsonKey(name: "hours_worked")
    String? hoursWorked,

    @JsonKey(name: "status")
    String? status,

    @JsonKey(name: "has_active_break")
    bool? hasActiveBreak,

    @JsonKey(name: "created_at")
    String? createdAt,

    @JsonKey(name: "updated_at")
    String? updatedAt,
  }) = _TodayAttendanceResponse;

  factory TodayAttendanceResponse.fromJson(Map<String, dynamic> json)
  => _$TodayAttendanceResponseFromJson(json);
}
