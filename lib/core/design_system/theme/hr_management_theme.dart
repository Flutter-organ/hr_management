import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/typography/hr_management_text_style.dart';
import 'color/hr_management_color_scheme.dart';

class HrManagementTheme {
  HrManagementTheme._();

  static ThemeData light() {
    const colors = HrManagementColorScheme.light;
    const hrManagementTextStyle = HrManagementTextStyle.hrManagementTextStyle;
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          secondary: colors.secondary,
          surface: colors.surface,
          error: colors.error,
          onError: colors.onError,
        ),
        extensions: const [
          HrManagementColorScheme.light,
          hrManagementTextStyle,
        ],
    );
  }

  static ThemeData dark() {
    const colors = HrManagementColorScheme.dark;
    const hrManagementTextStyle = HrManagementTextStyle.hrManagementTextStyle;
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          secondary: colors.secondary,
          surface: colors.surface,
          error: colors.error,
          onError: colors.onError,
        ),
        extensions: const [
          colors,
          hrManagementTextStyle,
        ],
    );
  }

}
