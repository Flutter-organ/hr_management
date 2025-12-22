import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/typography/hr_management_text_style.dart';

import 'color/hr_management_color_scheme.dart';

class HrManagementTheme {
  HrManagementTheme._();

  static ThemeData light() {
    const hrManagementColors = HrManagementColorScheme.light;
    const hrManagementTextStyle = HrManagementTextStyle.hrManagementTextStyle;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: hrManagementColors.primary,
        onPrimary: hrManagementColors.onPrimary,
        secondary: hrManagementColors.secondary,
        surface: hrManagementColors.surface,
        error: hrManagementColors.error,
        onError: hrManagementColors.onError,
      ),
      extensions: const [hrManagementColors, hrManagementTextStyle],
    );
  }

  static ThemeData dark() {
    const hrManagementColors = HrManagementColorScheme.dark;
    const hrManagementTextStyle = HrManagementTextStyle.hrManagementTextStyle;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: hrManagementColors.primary,
        onPrimary: hrManagementColors.onPrimary,
        secondary: hrManagementColors.secondary,
        surface: hrManagementColors.surface,
        error: hrManagementColors.error,
        onError: hrManagementColors.onError,
      ),
      extensions: const [hrManagementColors, hrManagementTextStyle],
    );
  }
}
