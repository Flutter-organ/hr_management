import 'package:flutter/material.dart';
import 'package:hr_management/core/constants/app_colors.dart';
import 'package:hr_management/core/constants/app_text_styles.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/expense_card_info.dart';
import 'widgets/expense_status.dart';

class ExpenseHistoryCard extends StatelessWidget {
  final String status;
  final String type;
  final double totalExpense;

  const ExpenseHistoryCard({
    super.key,
    this.status = "r",
    required this.type,
    required this.totalExpense,
  });

  @override
  Widget build(BuildContext context) {
    final color = context.colors;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Icon(Iconsax.receipt_2, color: AppColors.kPurple500),
              Text(
                "27 September 2024",
                style: AppTextStyles.titleLargeFontSemiBold,
              ),
            ],
          ),
          SizedBox(height: 12),
          ExpenseCardInfo(type: type, totalExpense: totalExpense),
          SizedBox(height: 8),
          if (status != "r") ...[ExpenseStatus(status: status)],
        ],
      ),
    );
  }
}
