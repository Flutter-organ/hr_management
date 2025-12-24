import 'package:flutter/material.dart';
import '../theme/helper/extention_colors.dart';

enum TaskPriority {
  high,
  medium,
  low;

  Color get colorTaskPriority => switch (this) {
    TaskPriority.high => ExtentionColors.red500,
    TaskPriority.medium =>ExtentionColors.yellow500,
    TaskPriority.low => ExtentionColors.green500
  };
  String get name => switch (this) {
    TaskPriority.high => "High",
    TaskPriority.medium => "Medium",
    TaskPriority.low => "Low"
  };
}
