import 'package:flutter/material.dart';

import 'app_constant_text.dart';

@immutable
class HrManagementTextStyle extends ThemeExtension<HrManagementTextStyle> {
  static const _fontFamily = 'Inter';
  final TextStyle displayLargeFont;
  final TextStyle displayMediumFont;
  final TextStyle displaySmallFont;

  final TextStyle titleLargeFont;
  final TextStyle titleLargeFontSemiBold;
  final TextStyle titleMediumFont;
  final TextStyle titleSmallFont;

  final TextStyle headLineLargeFont;
  final TextStyle headLineMediumFont;
  final TextStyle headLineSmallFont;

  final TextStyle bodyLargeFont;
  final TextStyle bodyMediumFont;
  final TextStyle bodySmallFont;
  

  final TextStyle labelLargeFont;
  final TextStyle labelMediumFont;
  final TextStyle labelSmallFont;

  const HrManagementTextStyle({
    required this.displayLargeFont,
    required this.displayMediumFont,
    required this.displaySmallFont,

    required this.titleLargeFont,
    required this.titleLargeFontSemiBold,
    required this.titleMediumFont,
    required this.titleSmallFont,

    required this.headLineLargeFont,
    required this.headLineMediumFont,
    required this.headLineSmallFont,

    required this.bodyLargeFont,
    required this.bodyMediumFont,
    required this.bodySmallFont,

    required this.labelLargeFont,
    required this.labelMediumFont,
    required this.labelSmallFont,
  });

  static const hrManagementTextStyle = HrManagementTextStyle(
    displayLargeFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize57,
      fontWeight: FontWeight.w400,
    ),
    displayMediumFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize45,
      fontWeight: FontWeight.w400,
    ),
    displaySmallFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize36,
      fontWeight: FontWeight.w400,
    ),
    titleLargeFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize14,
      fontWeight: FontWeight.w400,
    ),
    titleLargeFontSemiBold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize14,
      fontWeight: FontWeight.w600,
    ),
    titleMediumFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize12,
      fontWeight: FontWeight.w500,
    ),
    titleSmallFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize10,
      fontWeight: FontWeight.w500,
    ),
    headLineLargeFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize32,
      fontWeight: FontWeight.w400,
    ),
    headLineMediumFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize28,
      fontWeight: FontWeight.w400,
    ),
    headLineSmallFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize24,
      fontWeight: FontWeight.w400,
    ),
    bodyLargeFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize16,
      fontWeight: FontWeight.w400,
    ),
    bodyMediumFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize14,
      fontWeight: FontWeight.w400,
    ),
    bodySmallFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize12,
      fontWeight: FontWeight.w400,
    ),
    labelLargeFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize14,
      fontWeight: FontWeight.w400,
    ),
    labelMediumFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize12,
    ),
    labelSmallFont: TextStyle(
      fontFamily: _fontFamily,
      fontSize: AppConstantText.fontSize11,
    ),
  );

  @override
  ThemeExtension<HrManagementTextStyle> copyWith({
    TextStyle? displayLargeFont,
    TextStyle? displayMediumFont,
    TextStyle? displaySmallFont,
    TextStyle? titleLargeFont,
    TextStyle? titleLargeFontSemiBold,
    TextStyle? titleMediumFont,
    TextStyle? titleSmallFont,
    TextStyle? headLineLargeFont,
    TextStyle? headLineMediumFont,
    TextStyle? headLineSmallFont,
    TextStyle? bodyLargeFont,
    TextStyle? bodyMediumFont,
    TextStyle? bodySmallFont,
    TextStyle? labelLargeFont,
    TextStyle? labelMediumFont,
    TextStyle? labelSmallFont,
  }) {
    return HrManagementTextStyle(
      displayLargeFont: displayLargeFont ?? this.displayLargeFont,
      displayMediumFont: displayMediumFont ?? this.displayMediumFont,
      displaySmallFont: displaySmallFont ?? this.displaySmallFont,
      titleLargeFont: titleLargeFont ?? this.titleLargeFont,
      titleLargeFontSemiBold:
          titleLargeFontSemiBold ?? this.titleLargeFontSemiBold,
      titleMediumFont: titleMediumFont ?? this.titleMediumFont,
      titleSmallFont: titleSmallFont ?? this.titleSmallFont,
      headLineLargeFont: headLineLargeFont ?? this.headLineLargeFont,
      headLineMediumFont: headLineMediumFont ?? this.headLineMediumFont,
      headLineSmallFont: headLineSmallFont ?? this.headLineSmallFont,
      bodyLargeFont: bodyLargeFont ?? this.bodyLargeFont,
      bodyMediumFont: bodyMediumFont ?? this.bodyMediumFont,
      bodySmallFont: bodySmallFont ?? this.bodySmallFont,
      labelLargeFont: labelLargeFont ?? this.labelLargeFont,
      labelMediumFont: labelMediumFont ?? this.labelMediumFont,
      labelSmallFont: labelSmallFont ?? this.labelSmallFont,
    );
  }

  @override
  ThemeExtension<HrManagementTextStyle> lerp(
    covariant ThemeExtension<HrManagementTextStyle>? other,
    double t,
  ) {
    if (other is! HrManagementTextStyle) return this;
    return HrManagementTextStyle(
      displayLargeFont: TextStyle.lerp(
        displayLargeFont,
        other.displayLargeFont,
        t,
      )!,
      displayMediumFont: TextStyle.lerp(
        displayMediumFont,
        other.displayMediumFont,
        t,
      )!,
      displaySmallFont: TextStyle.lerp(
        displaySmallFont,
        other.displaySmallFont,
        t,
      )!,
      titleLargeFont: TextStyle.lerp(titleLargeFont, other.titleLargeFont, t)!,
      titleLargeFontSemiBold: TextStyle.lerp(
        titleLargeFontSemiBold,
        other.titleLargeFontSemiBold,
        t,
      )!,
      titleMediumFont: TextStyle.lerp(
        titleMediumFont,
        other.titleMediumFont,
        t,
      )!,
      titleSmallFont: TextStyle.lerp(titleSmallFont, other.titleSmallFont, t)!,
      headLineLargeFont: TextStyle.lerp(
        headLineLargeFont,
        other.headLineLargeFont,
        t,
      )!,
      headLineMediumFont: TextStyle.lerp(
        headLineMediumFont,
        other.headLineMediumFont,
        t,
      )!,
      headLineSmallFont: TextStyle.lerp(
        headLineSmallFont,
        other.headLineSmallFont,
        t,
      )!,
      bodyLargeFont: TextStyle.lerp(bodyLargeFont, other.bodyLargeFont, t)!,
      bodyMediumFont: TextStyle.lerp(bodyMediumFont, other.bodyMediumFont, t)!,
      bodySmallFont: TextStyle.lerp(bodySmallFont, other.bodySmallFont, t)!,
      labelLargeFont: TextStyle.lerp(labelLargeFont, other.labelLargeFont, t)!,
      labelMediumFont: TextStyle.lerp(labelMediumFont, other.labelMediumFont, t)!,
      labelSmallFont: TextStyle.lerp(labelSmallFont, other.labelSmallFont, t)!,
    );
  }
}
