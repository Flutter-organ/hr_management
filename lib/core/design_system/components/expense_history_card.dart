import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';

import '../theme/helper/extention_colors.dart';

class ExpenseHistoryCard extends StatelessWidget {
  final String status;
  final String type;
  final double totalExpense;
  final DateTime date;
  final String userName;
  final String? profileImage;

  const ExpenseHistoryCard({
    super.key,
    this.status = "r",
    required this.type,
    required this.totalExpense,
    required this.date,
    required this.userName,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Icon(Iconsax.receipt_2, color: ExtentionColors.iconDefault),
              Text(
                DateFormat(
                  'd MMMM y',
                  context.locale.languageCode,
                ).format(date),
                style: textTheme.titleLargeFontSemiBold,
              ),
            ],
          ),
          SizedBox(height: 12),
          expenseCardInfo(context),
          SizedBox(height: 8),
          if (status != "r") ...[expenseStatus(context)],
        ],
      ),
    );
  }

  Widget expenseCardInfo(BuildContext context) {
    final textTheme = context.textTheme;
    return Container(
      decoration: BoxDecoration(
        color: ExtentionColors.backgroundContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ExtentionColors.borderContainer),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text("type".tr(), style: textTheme.titleMediumFont),
              Text(type, style: textTheme.bodyLargeFont),
            ],
          ),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text("total_expense".tr(), style: textTheme.titleMediumFont),
              Text("\$$totalExpense", style: textTheme.bodyLargeFont),
            ],
          ),
        ],
      ),
    );
  }

  Widget expenseStatus(BuildContext context) {
    final txtTheme = context.textTheme;
    final color = context.colors;
    String formattedDate = DateFormat(
      'd MMM y',
      context.locale.languageCode,
    ).format(date);
    return Row(
      children: [
        Icon(
          Iconsax.tick_circle5,
          color: status == "ok" ? color.success500 : color.error,
          size: 16,
        ),
        SizedBox(width: 12),
        Text(
          status == "ok"
              ? "approved".tr(args: [formattedDate])
              : "rejected".tr(args: [formattedDate]),
          style: status == "ok"
              ? txtTheme.titleMediumFont.copyWith(color: color.success500)
              : txtTheme.titleMediumFont.copyWith(color: color.error),
        ),
        Spacer(),
        Text("by".tr(), style: txtTheme.titleMediumFont),
        CircleAvatar(
          backgroundImage: AssetImage(
            profileImage ?? AppAssets.profilePlaceholder,
          ),
          radius: 12,
        ),
        Text(" $userName ", style: txtTheme.titleMediumFont),
      ],
    );
  }
}
