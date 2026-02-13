class AttendanceClockInRequest {
  final num latitude;

  final num longitude;

  final String notes;
  final String proofImage;

  AttendanceClockInRequest({
    required this.latitude,
    required this.longitude,
    required this.notes,
    required this.proofImage,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['notes'] = notes;
    map['proof_image'] = proofImage;
    return map;
  }
}
