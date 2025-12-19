import 'package:flutter/material.dart';

import '../color/hr_management_color_scheme.dart';
import '../typography/hr_management_text_style.dart';

extension SellioThemeExtension on BuildContext {
  HrManagementColorScheme get colors => Theme.of(this).extension<HrManagementColorScheme>()!;
  HrManagementTextStyle get textTheme => Theme.of(this).extension<HrManagementTextStyle>()!;
}