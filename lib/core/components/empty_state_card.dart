// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hr_management/core/constants/app_text_styles.dart';

class EmptyStateCard extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final String imgPath;
  final String imgtitle;
  final String imgDescription;
  const EmptyStateCard({
    super.key,
    required this.titleText,
    required this.subTitleText,
    required this.imgPath,
    required this.imgtitle,
    required this.imgDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        children: [
          Text(titleText, style: AppTextStyles.titleLargeFontSemiBold),
          Text(subTitleText, style: AppTextStyles.titleMediumFont),
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
                Text(imgtitle, style: AppTextStyles.titleLargeFontSemiBold),
                Text(
                  imgDescription,
                  style: AppTextStyles.titleSmallFont,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
