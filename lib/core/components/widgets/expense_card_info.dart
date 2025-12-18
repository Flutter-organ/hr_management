import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class ExpenseCardInfo extends StatelessWidget {
  const ExpenseCardInfo({super.key , required this.type, required this.totalExpense});
 final String type;
 final double totalExpense;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kGray100,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text("Type", style: AppTextStyles.titleMediumFont),
              Text(type, style: AppTextStyles.bodyLargeFont),
            ],
          ),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text("Total Expense", style: AppTextStyles.titleMediumFont),
              Text("\$$totalExpense", style: AppTextStyles.bodyLargeFont),
            ],
          ),
        ],
      ),
    );
  }
}
