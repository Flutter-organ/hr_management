import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_management/core/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

class CustomBtnLowHighMedium extends StatelessWidget {
  final Color? color;
  final String title;
  const CustomBtnLowHighMedium({super.key, this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    final textstyle = context.textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: Row(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppAssets.kProperty),
          Text(title, style: textstyle.titleMediumFont),
        ],
      ),
    );
  }
}
