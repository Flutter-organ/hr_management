class AttendanceDayDto {
  final int id;
  final DateTime? date;

  final String? checkInTime;
  final String? checkOutTime;

  final double? hoursWorked;
  final double? overtimeHours;

  final String? status;
  final bool? hasActiveBreak;

  final String? checkInLocation;
  final String? proofImage;
  final String? notes;

  AttendanceDayDto({
    required this.id,
    this.date,
    this.checkInTime,
    this.checkOutTime,
    this.hoursWorked,
    this.overtimeHours,
    this.status,
    this.hasActiveBreak,
    this.checkInLocation,
    this.proofImage,
    this.notes,
  });

  factory AttendanceDayDto.fromJson(Map<String, dynamic> json) {
    return AttendanceDayDto(
      id: json['id'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      checkInTime: json['check_in_time'],
      checkOutTime: json['check_out_time'],
      hoursWorked: (json['hours_worked'] as num?)?.toDouble(),
      overtimeHours: (json['overtime_hours'] as num?)?.toDouble(),
      status: json['status'],
      hasActiveBreak: json['has_active_break'],
      checkInLocation: json['check_in_location'],
      proofImage: json['proof_image'],
      notes: json['notes'],
    );
  }
}
