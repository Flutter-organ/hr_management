// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_attendance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodayAttendanceResponse {

@JsonKey(name: "id") int? get id;@JsonKey(name: "date") String? get date;@JsonKey(name: "check_in_time") String? get checkInTime;@JsonKey(name: "check_out_time") String? get checkOutTime;@JsonKey(name: "check_in_location") String? get checkInLocation;@JsonKey(name: "check_out_location") String? get checkOutLocation;@JsonKey(name: "proof_image") String? get proofImage;@JsonKey(name: "notes") String? get notes;@JsonKey(name: "total_break_hours") num? get totalBreakHours;@JsonKey(name: "overtime_hours") String? get overtimeHours;@JsonKey(name: "hours_worked") String? get hoursWorked;@JsonKey(name: "status") String? get status;@JsonKey(name: "has_active_break") bool? get hasActiveBreak;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "updated_at") String? get updatedAt;
/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayAttendanceResponseCopyWith<TodayAttendanceResponse> get copyWith => _$TodayAttendanceResponseCopyWithImpl<TodayAttendanceResponse>(this as TodayAttendanceResponse, _$identity);

  /// Serializes this TodayAttendanceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayAttendanceResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.checkInLocation, checkInLocation) || other.checkInLocation == checkInLocation)&&(identical(other.checkOutLocation, checkOutLocation) || other.checkOutLocation == checkOutLocation)&&(identical(other.proofImage, proofImage) || other.proofImage == proofImage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.totalBreakHours, totalBreakHours) || other.totalBreakHours == totalBreakHours)&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.hoursWorked, hoursWorked) || other.hoursWorked == hoursWorked)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasActiveBreak, hasActiveBreak) || other.hasActiveBreak == hasActiveBreak)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,checkInTime,checkOutTime,checkInLocation,checkOutLocation,proofImage,notes,totalBreakHours,overtimeHours,hoursWorked,status,hasActiveBreak,createdAt,updatedAt);

@override
String toString() {
  return 'TodayAttendanceResponse(id: $id, date: $date, checkInTime: $checkInTime, checkOutTime: $checkOutTime, checkInLocation: $checkInLocation, checkOutLocation: $checkOutLocation, proofImage: $proofImage, notes: $notes, totalBreakHours: $totalBreakHours, overtimeHours: $overtimeHours, hoursWorked: $hoursWorked, status: $status, hasActiveBreak: $hasActiveBreak, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TodayAttendanceResponseCopyWith<$Res>  {
  factory $TodayAttendanceResponseCopyWith(TodayAttendanceResponse value, $Res Function(TodayAttendanceResponse) _then) = _$TodayAttendanceResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "date") String? date,@JsonKey(name: "check_in_time") String? checkInTime,@JsonKey(name: "check_out_time") String? checkOutTime,@JsonKey(name: "check_in_location") String? checkInLocation,@JsonKey(name: "check_out_location") String? checkOutLocation,@JsonKey(name: "proof_image") String? proofImage,@JsonKey(name: "notes") String? notes,@JsonKey(name: "total_break_hours") num? totalBreakHours,@JsonKey(name: "overtime_hours") String? overtimeHours,@JsonKey(name: "hours_worked") String? hoursWorked,@JsonKey(name: "status") String? status,@JsonKey(name: "has_active_break") bool? hasActiveBreak,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});




}
/// @nodoc
class _$TodayAttendanceResponseCopyWithImpl<$Res>
    implements $TodayAttendanceResponseCopyWith<$Res> {
  _$TodayAttendanceResponseCopyWithImpl(this._self, this._then);

  final TodayAttendanceResponse _self;
  final $Res Function(TodayAttendanceResponse) _then;

/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = freezed,Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? checkInLocation = freezed,Object? checkOutLocation = freezed,Object? proofImage = freezed,Object? notes = freezed,Object? totalBreakHours = freezed,Object? overtimeHours = freezed,Object? hoursWorked = freezed,Object? status = freezed,Object? hasActiveBreak = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,checkInLocation: freezed == checkInLocation ? _self.checkInLocation : checkInLocation // ignore: cast_nullable_to_non_nullable
as String?,checkOutLocation: freezed == checkOutLocation ? _self.checkOutLocation : checkOutLocation // ignore: cast_nullable_to_non_nullable
as String?,proofImage: freezed == proofImage ? _self.proofImage : proofImage // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,totalBreakHours: freezed == totalBreakHours ? _self.totalBreakHours : totalBreakHours // ignore: cast_nullable_to_non_nullable
as num?,overtimeHours: freezed == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as String?,hoursWorked: freezed == hoursWorked ? _self.hoursWorked : hoursWorked // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,hasActiveBreak: freezed == hasActiveBreak ? _self.hasActiveBreak : hasActiveBreak // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodayAttendanceResponse].
extension TodayAttendanceResponsePatterns on TodayAttendanceResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayAttendanceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayAttendanceResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayAttendanceResponse value)  $default,){
final _that = this;
switch (_that) {
case _TodayAttendanceResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayAttendanceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TodayAttendanceResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "check_in_time")  String? checkInTime, @JsonKey(name: "check_out_time")  String? checkOutTime, @JsonKey(name: "check_in_location")  String? checkInLocation, @JsonKey(name: "check_out_location")  String? checkOutLocation, @JsonKey(name: "proof_image")  String? proofImage, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "total_break_hours")  num? totalBreakHours, @JsonKey(name: "overtime_hours")  String? overtimeHours, @JsonKey(name: "hours_worked")  String? hoursWorked, @JsonKey(name: "status")  String? status, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayAttendanceResponse() when $default != null:
return $default(_that.id,_that.date,_that.checkInTime,_that.checkOutTime,_that.checkInLocation,_that.checkOutLocation,_that.proofImage,_that.notes,_that.totalBreakHours,_that.overtimeHours,_that.hoursWorked,_that.status,_that.hasActiveBreak,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "check_in_time")  String? checkInTime, @JsonKey(name: "check_out_time")  String? checkOutTime, @JsonKey(name: "check_in_location")  String? checkInLocation, @JsonKey(name: "check_out_location")  String? checkOutLocation, @JsonKey(name: "proof_image")  String? proofImage, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "total_break_hours")  num? totalBreakHours, @JsonKey(name: "overtime_hours")  String? overtimeHours, @JsonKey(name: "hours_worked")  String? hoursWorked, @JsonKey(name: "status")  String? status, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TodayAttendanceResponse():
return $default(_that.id,_that.date,_that.checkInTime,_that.checkOutTime,_that.checkInLocation,_that.checkOutLocation,_that.proofImage,_that.notes,_that.totalBreakHours,_that.overtimeHours,_that.hoursWorked,_that.status,_that.hasActiveBreak,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "check_in_time")  String? checkInTime, @JsonKey(name: "check_out_time")  String? checkOutTime, @JsonKey(name: "check_in_location")  String? checkInLocation, @JsonKey(name: "check_out_location")  String? checkOutLocation, @JsonKey(name: "proof_image")  String? proofImage, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "total_break_hours")  num? totalBreakHours, @JsonKey(name: "overtime_hours")  String? overtimeHours, @JsonKey(name: "hours_worked")  String? hoursWorked, @JsonKey(name: "status")  String? status, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TodayAttendanceResponse() when $default != null:
return $default(_that.id,_that.date,_that.checkInTime,_that.checkOutTime,_that.checkInLocation,_that.checkOutLocation,_that.proofImage,_that.notes,_that.totalBreakHours,_that.overtimeHours,_that.hoursWorked,_that.status,_that.hasActiveBreak,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodayAttendanceResponse implements TodayAttendanceResponse {
  const _TodayAttendanceResponse({@JsonKey(name: "id") this.id, @JsonKey(name: "date") this.date, @JsonKey(name: "check_in_time") this.checkInTime, @JsonKey(name: "check_out_time") this.checkOutTime, @JsonKey(name: "check_in_location") this.checkInLocation, @JsonKey(name: "check_out_location") this.checkOutLocation, @JsonKey(name: "proof_image") this.proofImage, @JsonKey(name: "notes") this.notes, @JsonKey(name: "total_break_hours") this.totalBreakHours, @JsonKey(name: "overtime_hours") this.overtimeHours, @JsonKey(name: "hours_worked") this.hoursWorked, @JsonKey(name: "status") this.status, @JsonKey(name: "has_active_break") this.hasActiveBreak, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt});
  factory _TodayAttendanceResponse.fromJson(Map<String, dynamic> json) => _$TodayAttendanceResponseFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "date") final  String? date;
@override@JsonKey(name: "check_in_time") final  String? checkInTime;
@override@JsonKey(name: "check_out_time") final  String? checkOutTime;
@override@JsonKey(name: "check_in_location") final  String? checkInLocation;
@override@JsonKey(name: "check_out_location") final  String? checkOutLocation;
@override@JsonKey(name: "proof_image") final  String? proofImage;
@override@JsonKey(name: "notes") final  String? notes;
@override@JsonKey(name: "total_break_hours") final  num? totalBreakHours;
@override@JsonKey(name: "overtime_hours") final  String? overtimeHours;
@override@JsonKey(name: "hours_worked") final  String? hoursWorked;
@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: "has_active_break") final  bool? hasActiveBreak;
@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "updated_at") final  String? updatedAt;

/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayAttendanceResponseCopyWith<_TodayAttendanceResponse> get copyWith => __$TodayAttendanceResponseCopyWithImpl<_TodayAttendanceResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodayAttendanceResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayAttendanceResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.checkInLocation, checkInLocation) || other.checkInLocation == checkInLocation)&&(identical(other.checkOutLocation, checkOutLocation) || other.checkOutLocation == checkOutLocation)&&(identical(other.proofImage, proofImage) || other.proofImage == proofImage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.totalBreakHours, totalBreakHours) || other.totalBreakHours == totalBreakHours)&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.hoursWorked, hoursWorked) || other.hoursWorked == hoursWorked)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasActiveBreak, hasActiveBreak) || other.hasActiveBreak == hasActiveBreak)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,checkInTime,checkOutTime,checkInLocation,checkOutLocation,proofImage,notes,totalBreakHours,overtimeHours,hoursWorked,status,hasActiveBreak,createdAt,updatedAt);

@override
String toString() {
  return 'TodayAttendanceResponse(id: $id, date: $date, checkInTime: $checkInTime, checkOutTime: $checkOutTime, checkInLocation: $checkInLocation, checkOutLocation: $checkOutLocation, proofImage: $proofImage, notes: $notes, totalBreakHours: $totalBreakHours, overtimeHours: $overtimeHours, hoursWorked: $hoursWorked, status: $status, hasActiveBreak: $hasActiveBreak, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TodayAttendanceResponseCopyWith<$Res> implements $TodayAttendanceResponseCopyWith<$Res> {
  factory _$TodayAttendanceResponseCopyWith(_TodayAttendanceResponse value, $Res Function(_TodayAttendanceResponse) _then) = __$TodayAttendanceResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "date") String? date,@JsonKey(name: "check_in_time") String? checkInTime,@JsonKey(name: "check_out_time") String? checkOutTime,@JsonKey(name: "check_in_location") String? checkInLocation,@JsonKey(name: "check_out_location") String? checkOutLocation,@JsonKey(name: "proof_image") String? proofImage,@JsonKey(name: "notes") String? notes,@JsonKey(name: "total_break_hours") num? totalBreakHours,@JsonKey(name: "overtime_hours") String? overtimeHours,@JsonKey(name: "hours_worked") String? hoursWorked,@JsonKey(name: "status") String? status,@JsonKey(name: "has_active_break") bool? hasActiveBreak,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});




}
/// @nodoc
class __$TodayAttendanceResponseCopyWithImpl<$Res>
    implements _$TodayAttendanceResponseCopyWith<$Res> {
  __$TodayAttendanceResponseCopyWithImpl(this._self, this._then);

  final _TodayAttendanceResponse _self;
  final $Res Function(_TodayAttendanceResponse) _then;

/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = freezed,Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? checkInLocation = freezed,Object? checkOutLocation = freezed,Object? proofImage = freezed,Object? notes = freezed,Object? totalBreakHours = freezed,Object? overtimeHours = freezed,Object? hoursWorked = freezed,Object? status = freezed,Object? hasActiveBreak = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TodayAttendanceResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,checkInLocation: freezed == checkInLocation ? _self.checkInLocation : checkInLocation // ignore: cast_nullable_to_non_nullable
as String?,checkOutLocation: freezed == checkOutLocation ? _self.checkOutLocation : checkOutLocation // ignore: cast_nullable_to_non_nullable
as String?,proofImage: freezed == proofImage ? _self.proofImage : proofImage // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,totalBreakHours: freezed == totalBreakHours ? _self.totalBreakHours : totalBreakHours // ignore: cast_nullable_to_non_nullable
as num?,overtimeHours: freezed == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as String?,hoursWorked: freezed == hoursWorked ? _self.hoursWorked : hoursWorked // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,hasActiveBreak: freezed == hasActiveBreak ? _self.hasActiveBreak : hasActiveBreak // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
