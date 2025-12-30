import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import '../theme/helper/extention_colors.dart';

enum TaskPriority {
  high,
  medium,
  low;

  Color colorTaskPriority(BuildContext context) {
    final colors = context.colors;
    return switch (this) {
      TaskPriority.high => colors.error500,
      TaskPriority.medium => colors.yellow500,
      TaskPriority.low => colors.success500,
    };
  }
  String get name => switch (this) {
    TaskPriority.high => "High",
    TaskPriority.medium => "Medium",
    TaskPriority.low => "Low"
  };
}
