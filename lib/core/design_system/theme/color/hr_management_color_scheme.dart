import 'package:flutter/material.dart';
import 'app_constant_colors.dart';

@immutable
class HrManagementColorScheme extends ThemeExtension<HrManagementColorScheme> {
  // ============== Primary ==============
  final Color primary;
  final Color primaryVariant;
  final Color onPrimary;

  // ============== Secondary ==============
  final Color secondary;
  final Color secondaryVariant;

  // ============== Surface ==============
  final Color surfaceLow;
  final Color surface;
  final Color surfaceHigh;

  // ============== Text ==============
  final Color title;
  final Color body;
  final Color hint;

  // ============== Border & Stroke ==============
  final Color stroke;
  final Color disabled;

  // ============== Semantic: Error ==============
  final Color error;
  final Color errorVariant;
  final Color onError; //

  // ============== Semantic: Success ==============
  final Color success;
  final Color successVariant; //
  final Color onSuccess; //

  // ============== Semantic: Warning ============== //
  final Color warning;
  final Color warningVariant;
  final Color onWarning;

  // ============== Semantic: state ============== //
  final Color good;
  final Color okay;
  final Color poor;
  final Color pad;

  const HrManagementColorScheme({
    required this.primary,
    required this.primaryVariant,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryVariant,
    required this.surfaceLow,
    required this.surface,
    required this.surfaceHigh,
    required this.title,
    required this.body,
    required this.hint,
    required this.stroke,
    required this.disabled,
    required this.error,
    required this.errorVariant,
    required this.onError,
    required this.success,
    required this.successVariant,
    required this.onSuccess,
    required this.warning,
    required this.warningVariant,
    required this.onWarning,
    required this.good,
    required this.okay,
    required this.poor,
    required this.pad,});

  static const light = HrManagementColorScheme(
    primary: AppConstantColors.purple600,
    primaryVariant: AppConstantColors.purple50,
    onPrimary: AppConstantColors.pureWhite,
    secondary: AppConstantColors.warning500,
    secondaryVariant: AppConstantColors.warning50,
    surfaceLow: AppConstantColors.pureWhite,
    surface: AppConstantColors.gray25,
    surfaceHigh: AppConstantColors.gray50,
    title: AppConstantColors.gray900,
    body: AppConstantColors.gray600,
    hint: AppConstantColors.gray400,
    stroke: AppConstantColors.gray100,
    disabled: AppConstantColors.gray200,
    error: AppConstantColors.error500,
    errorVariant: AppConstantColors.error50,
    onError: AppConstantColors.pureWhite,
    success: AppConstantColors.success500,
    successVariant: AppConstantColors.success50,
    onSuccess: AppConstantColors.pureWhite,
    warning: AppConstantColors.warning500,
    warningVariant: AppConstantColors.warning50,
    onWarning: AppConstantColors.gray900,
    good: AppConstantColors.good,
    okay: AppConstantColors.okay,
    poor: AppConstantColors.poor,
    pad: AppConstantColors.pad,
  );

  static const dark = HrManagementColorScheme(
    primary: AppConstantColors.purple400,
    primaryVariant: AppConstantColors.purple900,
    onPrimary: AppConstantColors.pureWhite,

    secondary: AppConstantColors.warning400,
    secondaryVariant: AppConstantColors.warning900,

    surfaceLow: AppConstantColors.gray900,
    surface: AppConstantColors.gray800,
    surfaceHigh: AppConstantColors.gray700,

    title: AppConstantColors.gray25,
    body: AppConstantColors.gray200,
    hint: AppConstantColors.gray400,

    stroke: AppConstantColors.gray700,
    disabled: AppConstantColors.gray600,

    error: AppConstantColors.error400,
    errorVariant: AppConstantColors.error900,
    onError: AppConstantColors.pureWhite,

    success: AppConstantColors.success400,
    successVariant: AppConstantColors.success900,
    onSuccess: AppConstantColors.pureWhite,

    warning: AppConstantColors.warning400,
    warningVariant: AppConstantColors.warning900,
    onWarning: AppConstantColors.gray900,

    good: AppConstantColors.good,
    okay: AppConstantColors.okay,
    poor: AppConstantColors.poor,
    pad: AppConstantColors.pad,
  );


  @override
  ThemeExtension<HrManagementColorScheme> copyWith({
    Color? primary,
    Color? primaryVariant,
    Color? onPrimary,
    Color? secondary,
    Color? secondaryVariant,
    Color? surfaceLow,
    Color? surface,
    Color? surfaceHigh,
    Color? title,
    Color? body,
    Color? hint,
    Color? stroke,
    Color? disabled,
    Color? error,
    Color? errorVariant,
    Color? onError,
    Color? success,
    Color? successVariant,
    Color? onSuccess,
    Color? warning,
    Color? warningVariant,
    Color? onWarning,
    Color? good,
    Color? okay,
    Color? poor,
    Color? pad,
}) {
    return HrManagementColorScheme(
        primary: primary ?? this.primary,
        primaryVariant: primaryVariant ?? this.primaryVariant,
        onPrimary: onPrimary ?? this.onPrimary,
        secondary: secondary ?? this.secondary,
        secondaryVariant: secondaryVariant ?? this.secondaryVariant,
        surfaceLow: surfaceLow ?? this.surfaceLow,
        surface: surface ?? this.surface,
        surfaceHigh: surfaceHigh ?? this.surfaceHigh,
        title: title ?? this.title,
        body: body ?? this.body,
        hint: hint ?? this.hint,
        stroke: stroke ?? this.stroke,
        disabled: disabled ?? this.disabled,
        error: error ?? this.error,
        errorVariant: errorVariant ?? this.errorVariant,
        onError: onError ?? this.onError,
        success: success ?? this.success,
        successVariant: successVariant ?? this.successVariant,
        onSuccess: onSuccess ?? this.onSuccess,
        warning: warning ?? this.warning,
        warningVariant: warningVariant ?? this.warningVariant,
        onWarning: onWarning ?? this.onWarning,
        good: good ?? this.good,
        okay: okay ?? this.okay,
        poor: poor ?? this.poor,
        pad: pad ?? this.pad,);
  }

  @override
  ThemeExtension<HrManagementColorScheme> lerp(covariant ThemeExtension<HrManagementColorScheme>? other, double t) {
    if (other is! HrManagementColorScheme) return this;
    return HrManagementColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryVariant: Color.lerp(secondaryVariant, other.secondaryVariant, t)!,
      surfaceLow: Color.lerp(surfaceLow, other.surfaceLow, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceHigh: Color.lerp(surfaceHigh, other.surfaceHigh, t)!,
      title: Color.lerp(title, other.title, t)!,
      body: Color.lerp(body, other.body, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
      stroke: Color.lerp(stroke, other.stroke, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorVariant: Color.lerp(errorVariant, other.errorVariant, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      success: Color.lerp(success, other.success, t)!,
      successVariant: Color.lerp(successVariant, other.successVariant, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningVariant: Color.lerp(warningVariant, other.warningVariant, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      good: Color.lerp(good, other.good, t)!,
      okay: Color.lerp(okay, other.okay, t)!,
      poor: Color.lerp(poor, other.poor, t)!,
      pad: Color.lerp(pad, other.pad, t)!,
    );
  }

}