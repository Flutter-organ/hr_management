
import 'package:hr_management/features/attendance/data/data_source/remote/attendance_remote_data_source.dart';

import '../../../../../core/data/network/api_constants.dart';
import '../../../../../core/data/network/dio_client.dart';
import 'dto/history_attendance_response.dart';
import 'dto/clock_in_attendance_request.dart';
import 'dto/today_attendance_response.dart';

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final DioClient _dioClient;

  const AttendanceRemoteDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<HistoryAttendanceResponse> attendanceHistory() async {
    final response = await _dioClient.get(
        ApiConstants.attendanceHistory,

    );
    return HistoryAttendanceResponse.fromJson( response.data['data']);
  }

  @override
  Future<TodayAttendanceResponse> attendanceToday() async {
    final response = await _dioClient.get(ApiConstants.attendanceToday);
    return TodayAttendanceResponse.fromJson( response.data['data']);
  }

  @override
  Future<bool> clockInAttendance(
      ClockInAttendanceRequest clockInAttendanceRequest,
      )  async {
    print("===========================${clockInAttendanceRequest.latitude}");
    print("===========================${clockInAttendanceRequest.longitude}");
    print("===========================${clockInAttendanceRequest.notes}");
    print("===========================${clockInAttendanceRequest.proofImage}");

    final response =  await _dioClient.post(
        ApiConstants.attendanceCheckIn,
        data: clockInAttendanceRequest.toJson()
        );
    return response.data['success'];
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
