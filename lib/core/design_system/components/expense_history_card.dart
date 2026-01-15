import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';

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
              Icon(Iconsax.receipt_2, color: context.colors.purple500),
              Text(
                DateFormat(
                  'd MMMM y',
                  context.locale.languageCode,
                ).format(date),
                style: textTheme.titleSmallFont,
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
        color: context.colors.gray100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colors.gray200),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "type".tr(),
                style: textTheme.labelMediumFont.copyWith(
                  color: context.colors.gray500,
                ),
              ),
              Text(
                type,
                style: textTheme.bodyLargeFont.copyWith(
                  color: context.colors.textBody,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "total_expense".tr(),
                style: textTheme.labelMediumFont.copyWith(
                  color: context.colors.gray500,
                ),
              ),
              Text(
                "\$$totalExpense",
                style: textTheme.bodyLargeFont.copyWith(
                  color: context.colors.textBody,
                ),
              ),
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
              ? txtTheme.labelMediumFont.copyWith(color: color.success500)
              : txtTheme.labelMediumFont.copyWith(color: color.error),
        ),
        Spacer(),
        Text(
          "by".tr(),
          style: txtTheme.labelMediumFont.copyWith(color: color.textPrimary),
        ),
        CircleAvatar(
          backgroundImage: AssetImage(
            profileImage ?? AppAssets.profilePlaceholder,
          ),
          radius: 12,
        ),
        Text(
          " $userName ",
          style: txtTheme.labelMediumFont.copyWith(color: color.textPrimary),
        ),
      ],
    );
  }
}
