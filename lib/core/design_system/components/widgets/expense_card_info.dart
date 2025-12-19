import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';


class ExpenseCardInfo extends StatelessWidget {
  const ExpenseCardInfo({
    super.key,
    required this.type,
    required this.totalExpense,
  });
  final String type;
  final double totalExpense;
  @override
  Widget build(BuildContext context) {
    final color = context.colors;
    final textTheme = context.textTheme;
    return Container(
      decoration: BoxDecoration(
        color: color.stroke,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text("Type", style: textTheme.titleMediumFont),
              Text(type, style: textTheme.bodyLargeFont),
            ],
          ),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text("Total Expense", style: textTheme.titleMediumFont),
              Text("\$$totalExpense", style: textTheme.bodyLargeFont),
            ],
          ),
        ],
      ),
    );
  }
}
