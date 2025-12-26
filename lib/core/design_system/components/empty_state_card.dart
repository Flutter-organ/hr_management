// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/extention_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

class EmptyStateCard extends StatelessWidget {
  final String imgPath;
  final String imgtitle;
  final String imgDescription;
  const EmptyStateCard({
    super.key,
    required this.imgPath,
    required this.imgtitle,
    required this.imgDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisAlignment: .center,
      children: [
        SizedBox(height: 24),
        Center(
          child: Column(
            children: [
              Container(
                height: 126,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imgPath)),
                ),
              ),
              SizedBox(height: 12),
              Text(
                imgtitle,
                style: context.textTheme.titleLargeFontSemiBold.copyWith(
                  color: ExtensionColors.textPrimary,
                ),
              ),
              Text(
                imgDescription,
                style: context.textTheme.titleSmallFont.copyWith(
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                  color: context.colors.gray300,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
