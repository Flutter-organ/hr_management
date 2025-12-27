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
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisSize: .min,
          children: [
            Image.asset(
              imgPath,
              height: 126,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                imgtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.titleLargeFontSemiBold.copyWith(
                  color: ExtensionColors.textPrimary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                imgDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.titleSmallFont.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colors.gray300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
