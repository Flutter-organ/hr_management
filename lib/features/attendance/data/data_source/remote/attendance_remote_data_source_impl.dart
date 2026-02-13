
import 'package:hr_management/features/attendance/data/data_source/remote/attendance_remote_data_source.dart';
import 'package:hr_management/features/attendance/data/data_source/remote/dto/Attendance_history_response.dart';
import 'package:hr_management/features/attendance/data/data_source/remote/dto/attendance_day.dart';

import '../../../../../core/data/network/api_constants.dart';
import '../../../../../core/data/network/dio_client.dart';
import 'dto/request.dart';

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final DioClient _dioClient;

  const AttendanceRemoteDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<AttendanceHistoryResponse> attendanceHistory() async {
    final response = await _dioClient.get(
        ApiConstants.attendanceHistory,

    );
    final data = response.data['data'] as Map<String, dynamic>;
    print("===========================$data");
    return AttendanceHistoryResponse.fromJson(data);
  }

  @override
  Future<AttendanceDayDto> attendanceToday() async {
    final response = await _dioClient.get(ApiConstants.attendanceToday);
    return AttendanceDayDto.fromJson(response.data);

  }

  @override
  Future<bool> attendanceClockIn(
      AttendanceClockInRequest attendanceClockInRequest,
      )  async {
    print("===========================${attendanceClockInRequest.latitude}");
    print("===========================${attendanceClockInRequest.longitude}");
    print("===========================${attendanceClockInRequest.notes}");
    print("===========================${attendanceClockInRequest.proofImage}");

    final response = await _dioClient.post(
        ApiConstants.attendanceCheckIn,
        data: attendanceClockInRequest.toJson()
        );
    return true;
  }


  @override
  Future<bool> attendanceClockOut() async{
    final response = await _dioClient.post(ApiConstants.attendanceCheckOut);
    return response.data['success'];
  }

  @override
  Future<bool> startAttendanceBreak() async {
    final response = await _dioClient.post(ApiConstants.startAttendanceBreak);
    return response.data['success'];
  }

  @override
  Future<bool> endAttendanceBreak() async {
    final response = await _dioClient.post(ApiConstants.endAttendanceBreak);
    return response.data['success'];
  }
}
