// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_attendance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryAttendanceResponse {

@JsonKey(name: "summary") SummaryResponse? get summary;@JsonKey(name: "month") int? get month;@JsonKey(name: "year") int? get year;@JsonKey(name: "records") List<DayResponse>? get dayResponse;
/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryAttendanceResponseCopyWith<HistoryAttendanceResponse> get copyWith => _$HistoryAttendanceResponseCopyWithImpl<HistoryAttendanceResponse>(this as HistoryAttendanceResponse, _$identity);

  /// Serializes this HistoryAttendanceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryAttendanceResponse&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&const DeepCollectionEquality().equals(other.dayResponse, dayResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,month,year,const DeepCollectionEquality().hash(dayResponse));

@override
String toString() {
  return 'HistoryAttendanceResponse(summary: $summary, month: $month, year: $year, dayResponse: $dayResponse)';
}


}

/// @nodoc
abstract mixin class $HistoryAttendanceResponseCopyWith<$Res>  {
  factory $HistoryAttendanceResponseCopyWith(HistoryAttendanceResponse value, $Res Function(HistoryAttendanceResponse) _then) = _$HistoryAttendanceResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "summary") SummaryResponse? summary,@JsonKey(name: "month") int? month,@JsonKey(name: "year") int? year,@JsonKey(name: "records") List<DayResponse>? dayResponse
});


$SummaryResponseCopyWith<$Res>? get summary;

}
/// @nodoc
class _$HistoryAttendanceResponseCopyWithImpl<$Res>
    implements $HistoryAttendanceResponseCopyWith<$Res> {
  _$HistoryAttendanceResponseCopyWithImpl(this._self, this._then);

  final HistoryAttendanceResponse _self;
  final $Res Function(HistoryAttendanceResponse) _then;

/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? month = freezed,Object? year = freezed,Object? dayResponse = freezed,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SummaryResponse?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,dayResponse: freezed == dayResponse ? _self.dayResponse : dayResponse // ignore: cast_nullable_to_non_nullable
as List<DayResponse>?,
  ));
}
/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryResponseCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SummaryResponseCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryAttendanceResponse].
extension HistoryAttendanceResponsePatterns on HistoryAttendanceResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryAttendanceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryAttendanceResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryAttendanceResponse value)  $default,){
final _that = this;
switch (_that) {
case _HistoryAttendanceResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryAttendanceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryAttendanceResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "summary")  SummaryResponse? summary, @JsonKey(name: "month")  int? month, @JsonKey(name: "year")  int? year, @JsonKey(name: "records")  List<DayResponse>? dayResponse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryAttendanceResponse() when $default != null:
return $default(_that.summary,_that.month,_that.year,_that.dayResponse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "summary")  SummaryResponse? summary, @JsonKey(name: "month")  int? month, @JsonKey(name: "year")  int? year, @JsonKey(name: "records")  List<DayResponse>? dayResponse)  $default,) {final _that = this;
switch (_that) {
case _HistoryAttendanceResponse():
return $default(_that.summary,_that.month,_that.year,_that.dayResponse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "summary")  SummaryResponse? summary, @JsonKey(name: "month")  int? month, @JsonKey(name: "year")  int? year, @JsonKey(name: "records")  List<DayResponse>? dayResponse)?  $default,) {final _that = this;
switch (_that) {
case _HistoryAttendanceResponse() when $default != null:
return $default(_that.summary,_that.month,_that.year,_that.dayResponse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryAttendanceResponse implements HistoryAttendanceResponse {
  const _HistoryAttendanceResponse({@JsonKey(name: "summary") this.summary, @JsonKey(name: "month") this.month, @JsonKey(name: "year") this.year, @JsonKey(name: "records") final  List<DayResponse>? dayResponse}): _dayResponse = dayResponse;
  factory _HistoryAttendanceResponse.fromJson(Map<String, dynamic> json) => _$HistoryAttendanceResponseFromJson(json);

@override@JsonKey(name: "summary") final  SummaryResponse? summary;
@override@JsonKey(name: "month") final  int? month;
@override@JsonKey(name: "year") final  int? year;
 final  List<DayResponse>? _dayResponse;
@override@JsonKey(name: "records") List<DayResponse>? get dayResponse {
  final value = _dayResponse;
  if (value == null) return null;
  if (_dayResponse is EqualUnmodifiableListView) return _dayResponse;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryAttendanceResponseCopyWith<_HistoryAttendanceResponse> get copyWith => __$HistoryAttendanceResponseCopyWithImpl<_HistoryAttendanceResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryAttendanceResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryAttendanceResponse&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&const DeepCollectionEquality().equals(other._dayResponse, _dayResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,month,year,const DeepCollectionEquality().hash(_dayResponse));

@override
String toString() {
  return 'HistoryAttendanceResponse(summary: $summary, month: $month, year: $year, dayResponse: $dayResponse)';
}


}

/// @nodoc
abstract mixin class _$HistoryAttendanceResponseCopyWith<$Res> implements $HistoryAttendanceResponseCopyWith<$Res> {
  factory _$HistoryAttendanceResponseCopyWith(_HistoryAttendanceResponse value, $Res Function(_HistoryAttendanceResponse) _then) = __$HistoryAttendanceResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "summary") SummaryResponse? summary,@JsonKey(name: "month") int? month,@JsonKey(name: "year") int? year,@JsonKey(name: "records") List<DayResponse>? dayResponse
});


@override $SummaryResponseCopyWith<$Res>? get summary;

}
/// @nodoc
class __$HistoryAttendanceResponseCopyWithImpl<$Res>
    implements _$HistoryAttendanceResponseCopyWith<$Res> {
  __$HistoryAttendanceResponseCopyWithImpl(this._self, this._then);

  final _HistoryAttendanceResponse _self;
  final $Res Function(_HistoryAttendanceResponse) _then;

/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? month = freezed,Object? year = freezed,Object? dayResponse = freezed,}) {
  return _then(_HistoryAttendanceResponse(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SummaryResponse?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,dayResponse: freezed == dayResponse ? _self._dayResponse : dayResponse // ignore: cast_nullable_to_non_nullable
as List<DayResponse>?,
  ));
}

/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryResponseCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SummaryResponseCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$DayResponse {

@JsonKey(name: "id") int? get id;@JsonKey(name: "date") String? get date;@JsonKey(name: "proof_image") String? get proofImage;@JsonKey(name: "notes") String? get notes;@JsonKey(name: "total_break_hours") num? get totalBreakHours;@JsonKey(name: "overtime_hours") String? get overtimeHours;@JsonKey(name: "check_in_time") String? get checkInTime;@JsonKey(name: "check_out_time") String? get checkOutTime;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "check_in_location") String? get checkInLocation;@JsonKey(name: "check_out_location") String? get checkOutLocation;@JsonKey(name: "updated_at") String? get updatedAt;@JsonKey(name: "hours_worked") String? get hoursWorked;@JsonKey(name: "has_active_break") bool? get hasActiveBreak;@JsonKey(name: "status") String? get status;
/// Create a copy of DayResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayResponseCopyWith<DayResponse> get copyWith => _$DayResponseCopyWithImpl<DayResponse>(this as DayResponse, _$identity);

  /// Serializes this DayResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.proofImage, proofImage) || other.proofImage == proofImage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.totalBreakHours, totalBreakHours) || other.totalBreakHours == totalBreakHours)&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.checkInLocation, checkInLocation) || other.checkInLocation == checkInLocation)&&(identical(other.checkOutLocation, checkOutLocation) || other.checkOutLocation == checkOutLocation)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.hoursWorked, hoursWorked) || other.hoursWorked == hoursWorked)&&(identical(other.hasActiveBreak, hasActiveBreak) || other.hasActiveBreak == hasActiveBreak)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,proofImage,notes,totalBreakHours,overtimeHours,checkInTime,checkOutTime,createdAt,checkInLocation,checkOutLocation,updatedAt,hoursWorked,hasActiveBreak,status);

@override
String toString() {
  return 'DayResponse(id: $id, date: $date, proofImage: $proofImage, notes: $notes, totalBreakHours: $totalBreakHours, overtimeHours: $overtimeHours, checkInTime: $checkInTime, checkOutTime: $checkOutTime, createdAt: $createdAt, checkInLocation: $checkInLocation, checkOutLocation: $checkOutLocation, updatedAt: $updatedAt, hoursWorked: $hoursWorked, hasActiveBreak: $hasActiveBreak, status: $status)';
}


}

/// @nodoc
abstract mixin class $DayResponseCopyWith<$Res>  {
  factory $DayResponseCopyWith(DayResponse value, $Res Function(DayResponse) _then) = _$DayResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "date") String? date,@JsonKey(name: "proof_image") String? proofImage,@JsonKey(name: "notes") String? notes,@JsonKey(name: "total_break_hours") num? totalBreakHours,@JsonKey(name: "overtime_hours") String? overtimeHours,@JsonKey(name: "check_in_time") String? checkInTime,@JsonKey(name: "check_out_time") String? checkOutTime,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "check_in_location") String? checkInLocation,@JsonKey(name: "check_out_location") String? checkOutLocation,@JsonKey(name: "updated_at") String? updatedAt,@JsonKey(name: "hours_worked") String? hoursWorked,@JsonKey(name: "has_active_break") bool? hasActiveBreak,@JsonKey(name: "status") String? status
});




}
/// @nodoc
class _$DayResponseCopyWithImpl<$Res>
    implements $DayResponseCopyWith<$Res> {
  _$DayResponseCopyWithImpl(this._self, this._then);

  final DayResponse _self;
  final $Res Function(DayResponse) _then;

/// Create a copy of DayResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = freezed,Object? proofImage = freezed,Object? notes = freezed,Object? totalBreakHours = freezed,Object? overtimeHours = freezed,Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? createdAt = freezed,Object? checkInLocation = freezed,Object? checkOutLocation = freezed,Object? updatedAt = freezed,Object? hoursWorked = freezed,Object? hasActiveBreak = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,proofImage: freezed == proofImage ? _self.proofImage : proofImage // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,totalBreakHours: freezed == totalBreakHours ? _self.totalBreakHours : totalBreakHours // ignore: cast_nullable_to_non_nullable
as num?,overtimeHours: freezed == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as String?,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,checkInLocation: freezed == checkInLocation ? _self.checkInLocation : checkInLocation // ignore: cast_nullable_to_non_nullable
as String?,checkOutLocation: freezed == checkOutLocation ? _self.checkOutLocation : checkOutLocation // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,hoursWorked: freezed == hoursWorked ? _self.hoursWorked : hoursWorked // ignore: cast_nullable_to_non_nullable
as String?,hasActiveBreak: freezed == hasActiveBreak ? _self.hasActiveBreak : hasActiveBreak // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DayResponse].
extension DayResponsePatterns on DayResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayResponse value)  $default,){
final _that = this;
switch (_that) {
case _DayResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DayResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "proof_image")  String? proofImage, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "total_break_hours")  num? totalBreakHours, @JsonKey(name: "overtime_hours")  String? overtimeHours, @JsonKey(name: "check_in_time")  String? checkInTime, @JsonKey(name: "check_out_time")  String? checkOutTime, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "check_in_location")  String? checkInLocation, @JsonKey(name: "check_out_location")  String? checkOutLocation, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "hours_worked")  String? hoursWorked, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "status")  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayResponse() when $default != null:
return $default(_that.id,_that.date,_that.proofImage,_that.notes,_that.totalBreakHours,_that.overtimeHours,_that.checkInTime,_that.checkOutTime,_that.createdAt,_that.checkInLocation,_that.checkOutLocation,_that.updatedAt,_that.hoursWorked,_that.hasActiveBreak,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "proof_image")  String? proofImage, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "total_break_hours")  num? totalBreakHours, @JsonKey(name: "overtime_hours")  String? overtimeHours, @JsonKey(name: "check_in_time")  String? checkInTime, @JsonKey(name: "check_out_time")  String? checkOutTime, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "check_in_location")  String? checkInLocation, @JsonKey(name: "check_out_location")  String? checkOutLocation, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "hours_worked")  String? hoursWorked, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "status")  String? status)  $default,) {final _that = this;
switch (_that) {
case _DayResponse():
return $default(_that.id,_that.date,_that.proofImage,_that.notes,_that.totalBreakHours,_that.overtimeHours,_that.checkInTime,_that.checkOutTime,_that.createdAt,_that.checkInLocation,_that.checkOutLocation,_that.updatedAt,_that.hoursWorked,_that.hasActiveBreak,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "proof_image")  String? proofImage, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "total_break_hours")  num? totalBreakHours, @JsonKey(name: "overtime_hours")  String? overtimeHours, @JsonKey(name: "check_in_time")  String? checkInTime, @JsonKey(name: "check_out_time")  String? checkOutTime, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "check_in_location")  String? checkInLocation, @JsonKey(name: "check_out_location")  String? checkOutLocation, @JsonKey(name: "updated_at")  String? updatedAt, @JsonKey(name: "hours_worked")  String? hoursWorked, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "status")  String? status)?  $default,) {final _that = this;
switch (_that) {
case _DayResponse() when $default != null:
return $default(_that.id,_that.date,_that.proofImage,_that.notes,_that.totalBreakHours,_that.overtimeHours,_that.checkInTime,_that.checkOutTime,_that.createdAt,_that.checkInLocation,_that.checkOutLocation,_that.updatedAt,_that.hoursWorked,_that.hasActiveBreak,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DayResponse implements DayResponse {
  const _DayResponse({@JsonKey(name: "id") this.id, @JsonKey(name: "date") this.date, @JsonKey(name: "proof_image") this.proofImage, @JsonKey(name: "notes") this.notes, @JsonKey(name: "total_break_hours") this.totalBreakHours, @JsonKey(name: "overtime_hours") this.overtimeHours, @JsonKey(name: "check_in_time") this.checkInTime, @JsonKey(name: "check_out_time") this.checkOutTime, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "check_in_location") this.checkInLocation, @JsonKey(name: "check_out_location") this.checkOutLocation, @JsonKey(name: "updated_at") this.updatedAt, @JsonKey(name: "hours_worked") this.hoursWorked, @JsonKey(name: "has_active_break") this.hasActiveBreak, @JsonKey(name: "status") this.status});
  factory _DayResponse.fromJson(Map<String, dynamic> json) => _$DayResponseFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "date") final  String? date;
@override@JsonKey(name: "proof_image") final  String? proofImage;
@override@JsonKey(name: "notes") final  String? notes;
@override@JsonKey(name: "total_break_hours") final  num? totalBreakHours;
@override@JsonKey(name: "overtime_hours") final  String? overtimeHours;
@override@JsonKey(name: "check_in_time") final  String? checkInTime;
@override@JsonKey(name: "check_out_time") final  String? checkOutTime;
@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "check_in_location") final  String? checkInLocation;
@override@JsonKey(name: "check_out_location") final  String? checkOutLocation;
@override@JsonKey(name: "updated_at") final  String? updatedAt;
@override@JsonKey(name: "hours_worked") final  String? hoursWorked;
@override@JsonKey(name: "has_active_break") final  bool? hasActiveBreak;
@override@JsonKey(name: "status") final  String? status;

/// Create a copy of DayResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayResponseCopyWith<_DayResponse> get copyWith => __$DayResponseCopyWithImpl<_DayResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.proofImage, proofImage) || other.proofImage == proofImage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.totalBreakHours, totalBreakHours) || other.totalBreakHours == totalBreakHours)&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.checkInLocation, checkInLocation) || other.checkInLocation == checkInLocation)&&(identical(other.checkOutLocation, checkOutLocation) || other.checkOutLocation == checkOutLocation)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.hoursWorked, hoursWorked) || other.hoursWorked == hoursWorked)&&(identical(other.hasActiveBreak, hasActiveBreak) || other.hasActiveBreak == hasActiveBreak)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,proofImage,notes,totalBreakHours,overtimeHours,checkInTime,checkOutTime,createdAt,checkInLocation,checkOutLocation,updatedAt,hoursWorked,hasActiveBreak,status);

@override
String toString() {
  return 'DayResponse(id: $id, date: $date, proofImage: $proofImage, notes: $notes, totalBreakHours: $totalBreakHours, overtimeHours: $overtimeHours, checkInTime: $checkInTime, checkOutTime: $checkOutTime, createdAt: $createdAt, checkInLocation: $checkInLocation, checkOutLocation: $checkOutLocation, updatedAt: $updatedAt, hoursWorked: $hoursWorked, hasActiveBreak: $hasActiveBreak, status: $status)';
}


}

/// @nodoc
abstract mixin class _$DayResponseCopyWith<$Res> implements $DayResponseCopyWith<$Res> {
  factory _$DayResponseCopyWith(_DayResponse value, $Res Function(_DayResponse) _then) = __$DayResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "date") String? date,@JsonKey(name: "proof_image") String? proofImage,@JsonKey(name: "notes") String? notes,@JsonKey(name: "total_break_hours") num? totalBreakHours,@JsonKey(name: "overtime_hours") String? overtimeHours,@JsonKey(name: "check_in_time") String? checkInTime,@JsonKey(name: "check_out_time") String? checkOutTime,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "check_in_location") String? checkInLocation,@JsonKey(name: "check_out_location") String? checkOutLocation,@JsonKey(name: "updated_at") String? updatedAt,@JsonKey(name: "hours_worked") String? hoursWorked,@JsonKey(name: "has_active_break") bool? hasActiveBreak,@JsonKey(name: "status") String? status
});




}
/// @nodoc
class __$DayResponseCopyWithImpl<$Res>
    implements _$DayResponseCopyWith<$Res> {
  __$DayResponseCopyWithImpl(this._self, this._then);

  final _DayResponse _self;
  final $Res Function(_DayResponse) _then;

/// Create a copy of DayResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = freezed,Object? proofImage = freezed,Object? notes = freezed,Object? totalBreakHours = freezed,Object? overtimeHours = freezed,Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? createdAt = freezed,Object? checkInLocation = freezed,Object? checkOutLocation = freezed,Object? updatedAt = freezed,Object? hoursWorked = freezed,Object? hasActiveBreak = freezed,Object? status = freezed,}) {
  return _then(_DayResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,proofImage: freezed == proofImage ? _self.proofImage : proofImage // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,totalBreakHours: freezed == totalBreakHours ? _self.totalBreakHours : totalBreakHours // ignore: cast_nullable_to_non_nullable
as num?,overtimeHours: freezed == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as String?,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,checkInLocation: freezed == checkInLocation ? _self.checkInLocation : checkInLocation // ignore: cast_nullable_to_non_nullable
as String?,checkOutLocation: freezed == checkOutLocation ? _self.checkOutLocation : checkOutLocation // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,hoursWorked: freezed == hoursWorked ? _self.hoursWorked : hoursWorked // ignore: cast_nullable_to_non_nullable
as String?,hasActiveBreak: freezed == hasActiveBreak ? _self.hasActiveBreak : hasActiveBreak // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SummaryResponse {

@JsonKey(name: "overtime_hours") num? get overtimeHours;@JsonKey(name: "late_days") int? get lateDays;@JsonKey(name: "present_days") int? get presentDays;@JsonKey(name: "total_hours") num? get totalHours;@JsonKey(name: "total_days") int? get totalDays;@JsonKey(name: "absent_days") int? get absentDays;
/// Create a copy of SummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryResponseCopyWith<SummaryResponse> get copyWith => _$SummaryResponseCopyWithImpl<SummaryResponse>(this as SummaryResponse, _$identity);

  /// Serializes this SummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryResponse&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.lateDays, lateDays) || other.lateDays == lateDays)&&(identical(other.presentDays, presentDays) || other.presentDays == presentDays)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.absentDays, absentDays) || other.absentDays == absentDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,overtimeHours,lateDays,presentDays,totalHours,totalDays,absentDays);

@override
String toString() {
  return 'SummaryResponse(overtimeHours: $overtimeHours, lateDays: $lateDays, presentDays: $presentDays, totalHours: $totalHours, totalDays: $totalDays, absentDays: $absentDays)';
}


}

/// @nodoc
abstract mixin class $SummaryResponseCopyWith<$Res>  {
  factory $SummaryResponseCopyWith(SummaryResponse value, $Res Function(SummaryResponse) _then) = _$SummaryResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "overtime_hours") num? overtimeHours,@JsonKey(name: "late_days") int? lateDays,@JsonKey(name: "present_days") int? presentDays,@JsonKey(name: "total_hours") num? totalHours,@JsonKey(name: "total_days") int? totalDays,@JsonKey(name: "absent_days") int? absentDays
});




}
/// @nodoc
class _$SummaryResponseCopyWithImpl<$Res>
    implements $SummaryResponseCopyWith<$Res> {
  _$SummaryResponseCopyWithImpl(this._self, this._then);

  final SummaryResponse _self;
  final $Res Function(SummaryResponse) _then;

/// Create a copy of SummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? overtimeHours = freezed,Object? lateDays = freezed,Object? presentDays = freezed,Object? totalHours = freezed,Object? totalDays = freezed,Object? absentDays = freezed,}) {
  return _then(_self.copyWith(
overtimeHours: freezed == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as num?,lateDays: freezed == lateDays ? _self.lateDays : lateDays // ignore: cast_nullable_to_non_nullable
as int?,presentDays: freezed == presentDays ? _self.presentDays : presentDays // ignore: cast_nullable_to_non_nullable
as int?,totalHours: freezed == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as num?,totalDays: freezed == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int?,absentDays: freezed == absentDays ? _self.absentDays : absentDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SummaryResponse].
extension SummaryResponsePatterns on SummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _SummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "overtime_hours")  num? overtimeHours, @JsonKey(name: "late_days")  int? lateDays, @JsonKey(name: "present_days")  int? presentDays, @JsonKey(name: "total_hours")  num? totalHours, @JsonKey(name: "total_days")  int? totalDays, @JsonKey(name: "absent_days")  int? absentDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryResponse() when $default != null:
return $default(_that.overtimeHours,_that.lateDays,_that.presentDays,_that.totalHours,_that.totalDays,_that.absentDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "overtime_hours")  num? overtimeHours, @JsonKey(name: "late_days")  int? lateDays, @JsonKey(name: "present_days")  int? presentDays, @JsonKey(name: "total_hours")  num? totalHours, @JsonKey(name: "total_days")  int? totalDays, @JsonKey(name: "absent_days")  int? absentDays)  $default,) {final _that = this;
switch (_that) {
case _SummaryResponse():
return $default(_that.overtimeHours,_that.lateDays,_that.presentDays,_that.totalHours,_that.totalDays,_that.absentDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "overtime_hours")  num? overtimeHours, @JsonKey(name: "late_days")  int? lateDays, @JsonKey(name: "present_days")  int? presentDays, @JsonKey(name: "total_hours")  num? totalHours, @JsonKey(name: "total_days")  int? totalDays, @JsonKey(name: "absent_days")  int? absentDays)?  $default,) {final _that = this;
switch (_that) {
case _SummaryResponse() when $default != null:
return $default(_that.overtimeHours,_that.lateDays,_that.presentDays,_that.totalHours,_that.totalDays,_that.absentDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummaryResponse implements SummaryResponse {
  const _SummaryResponse({@JsonKey(name: "overtime_hours") this.overtimeHours, @JsonKey(name: "late_days") this.lateDays, @JsonKey(name: "present_days") this.presentDays, @JsonKey(name: "total_hours") this.totalHours, @JsonKey(name: "total_days") this.totalDays, @JsonKey(name: "absent_days") this.absentDays});
  factory _SummaryResponse.fromJson(Map<String, dynamic> json) => _$SummaryResponseFromJson(json);

@override@JsonKey(name: "overtime_hours") final  num? overtimeHours;
@override@JsonKey(name: "late_days") final  int? lateDays;
@override@JsonKey(name: "present_days") final  int? presentDays;
@override@JsonKey(name: "total_hours") final  num? totalHours;
@override@JsonKey(name: "total_days") final  int? totalDays;
@override@JsonKey(name: "absent_days") final  int? absentDays;

/// Create a copy of SummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryResponseCopyWith<_SummaryResponse> get copyWith => __$SummaryResponseCopyWithImpl<_SummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryResponse&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.lateDays, lateDays) || other.lateDays == lateDays)&&(identical(other.presentDays, presentDays) || other.presentDays == presentDays)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.absentDays, absentDays) || other.absentDays == absentDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,overtimeHours,lateDays,presentDays,totalHours,totalDays,absentDays);

@override
String toString() {
  return 'SummaryResponse(overtimeHours: $overtimeHours, lateDays: $lateDays, presentDays: $presentDays, totalHours: $totalHours, totalDays: $totalDays, absentDays: $absentDays)';
}


}

/// @nodoc
abstract mixin class _$SummaryResponseCopyWith<$Res> implements $SummaryResponseCopyWith<$Res> {
  factory _$SummaryResponseCopyWith(_SummaryResponse value, $Res Function(_SummaryResponse) _then) = __$SummaryResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "overtime_hours") num? overtimeHours,@JsonKey(name: "late_days") int? lateDays,@JsonKey(name: "present_days") int? presentDays,@JsonKey(name: "total_hours") num? totalHours,@JsonKey(name: "total_days") int? totalDays,@JsonKey(name: "absent_days") int? absentDays
});




}
/// @nodoc
class __$SummaryResponseCopyWithImpl<$Res>
    implements _$SummaryResponseCopyWith<$Res> {
  __$SummaryResponseCopyWithImpl(this._self, this._then);

  final _SummaryResponse _self;
  final $Res Function(_SummaryResponse) _then;

/// Create a copy of SummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? overtimeHours = freezed,Object? lateDays = freezed,Object? presentDays = freezed,Object? totalHours = freezed,Object? totalDays = freezed,Object? absentDays = freezed,}) {
  return _then(_SummaryResponse(
overtimeHours: freezed == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as num?,lateDays: freezed == lateDays ? _self.lateDays : lateDays // ignore: cast_nullable_to_non_nullable
as int?,presentDays: freezed == presentDays ? _self.presentDays : presentDays // ignore: cast_nullable_to_non_nullable
as int?,totalHours: freezed == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as num?,totalDays: freezed == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int?,absentDays: freezed == absentDays ? _self.absentDays : absentDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
