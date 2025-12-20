// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

// ignore: must_be_immutable
class EmptyStateCard extends StatelessWidget {
  String titleText;
  String subTitleText;
  String imgPath;
  String imgtitle;
  String imgDescription;
  EmptyStateCard({super.key, 
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
          Text(titleText, style: context.textTheme.titleLargeFontSemiBold),
          Text(subTitleText, style: context.textTheme.titleMediumFont),
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
                Text(imgtitle, style: context.textTheme.titleLargeFontSemiBold),
                Text(
                  imgDescription,
                  style: context.textTheme.titleSmallFont,
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
