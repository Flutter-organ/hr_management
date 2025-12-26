import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/time_extension.dart';

class MeetingDataModel {
  String meetingTitle;
  TimeOfDay startTime;
  TimeOfDay endTime;
  List<String> userImages;

  MeetingDataModel({
    required this.meetingTitle,
    required this.startTime,
    required this.endTime,
    required this.userImages,
  });

  String formatTime(BuildContext context) => "${startTime.formatTime(context)} - ${endTime.formatTime(context)}";
}
