import 'package:flutter/foundation.dart';
import 'package:hr_management/features/attendance/data/data_source/remote/attendance_remote_data_source.dart';
import 'package:hr_management/features/attendance/data/data_source/remote/dto/Attendance_history_response.dart';

import '../../../../../core/data/network/api_constants.dart';
import '../../../../../core/data/network/dio_client.dart';

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final DioClient _dioClient;

  const AttendanceRemoteDataSourceImpl({required DioClient dioClient})
    : _dioClient = dioClient;

  @override
  Future<AttendanceHistoryResponse> attendanceHistory() async {
    final response = await _dioClient.get(ApiConstants.attendanceHistory);
    final data = response.data['data'] as Map<String, dynamic>;
    print("ttttttttttttt-===========================$data");
    return AttendanceHistoryResponse.fromJson(data);
  }
}
