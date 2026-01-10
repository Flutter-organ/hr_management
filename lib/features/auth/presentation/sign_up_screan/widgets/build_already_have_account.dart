import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/design_system/theme/color/app_constant_colors.dart';
import '../../../../../core/design_system/theme/helper/theme_extention.dart';

Widget buildAlreadyHaveAnAccount(BuildContext context) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "Already have an account?".tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GestureDetector(
            onTap: (){},
            child: Text(
              "Sign in here".tr(),
              style: context.textTheme.labelMediumFont.copyWith(
                color: AppConstantColors.purple500,
              ),
            ),
          ),
        ),
      ],
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
