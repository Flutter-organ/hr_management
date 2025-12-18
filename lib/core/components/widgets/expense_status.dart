import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class ExpenseStatus extends StatelessWidget {
  final String status;
  const ExpenseStatus({super.key, this.status = "r"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Iconsax.tick_circle5,
          color: status == "ok" ? AppColors.kSuccess500 : AppColors.kError500,
          size: 16,
        ),
        SizedBox(width: 12),
        Text(
          status == "ok"
              ? "Approved at 28 sept 2024"
              : "Rejected at 28 sept 2024",
          style: status == "ok"
              ? AppTextStyles.titleMediumFontGreen
              : AppTextStyles.titleMediumFontRed,
        ),
        Spacer(),
        Text(" By ", style: AppTextStyles.titleMediumFontGrey),
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.png"),
          radius: 12,
        ),
        Text(" Elaine ", style: AppTextStyles.titleMediumFontGrey),
      ],
    );
  }
}
