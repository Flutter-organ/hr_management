class AttendanceHistoryDaysDto {
  AttendanceHistoryDaysDto({
      num? id, 
      String? date, 
      String? checkInTime, 
      dynamic checkInLocation, 
      dynamic checkOutTime, 
      dynamic checkOutLocation, 
      String? hoursWorked, 
      String? overtimeHours, 
      String? status, 
      String? notes, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _date = date;
    _checkInTime = checkInTime;
    _checkInLocation = checkInLocation;
    _checkOutTime = checkOutTime;
    _checkOutLocation = checkOutLocation;
    _hoursWorked = hoursWorked;
    _overtimeHours = overtimeHours;
    _status = status;
    _notes = notes;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  AttendanceHistoryDaysDto.fromJson(dynamic json) {
    _id = json['id'];
    _date = json['date'];
    _checkInTime = json['check_in_time'];
    _checkInLocation = json['check_in_location'];
    _checkOutTime = json['check_out_time'];
    _checkOutLocation = json['check_out_location'];
    _hoursWorked = json['hours_worked'];
    _overtimeHours = json['overtime_hours'];
    _status = json['status'];
    _notes = json['notes'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _date;
  String? _checkInTime;
  dynamic _checkInLocation;
  dynamic _checkOutTime;
  dynamic _checkOutLocation;
  String? _hoursWorked;
  String? _overtimeHours;
  String? _status;
  String? _notes;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;
  String? get date => _date;
  String? get checkInTime => _checkInTime;
  dynamic get checkInLocation => _checkInLocation;
  dynamic get checkOutTime => _checkOutTime;
  dynamic get checkOutLocation => _checkOutLocation;
  String? get hoursWorked => _hoursWorked;
  String? get overtimeHours => _overtimeHours;
  String? get status => _status;
  String? get notes => _notes;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
}