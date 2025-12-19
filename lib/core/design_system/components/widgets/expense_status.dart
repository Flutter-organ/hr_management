import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';


class ExpenseStatus extends StatelessWidget {
  final String status;
  const ExpenseStatus({super.key, this.status = "r"});

  @override
  Widget build(BuildContext context) {
    final txtTheme = context.textTheme;
    final color = context.colors;
    return Row(
      children: [
        Icon(
          Iconsax.tick_circle5,
          color: status == "ok" ? color.success : color.error,
          size: 16,
        ),
        SizedBox(width: 12),
        Text(
          status == "ok"
              ? "Approved at 28 sept 2024"
              : "Rejected at 28 sept 2024",
          style: status == "ok"
              ? txtTheme.titleMediumFont.copyWith(color: color.success)
              : txtTheme.titleMediumFont.copyWith(color: color.error),
        ),
        Spacer(),
        Text(" By ", style: txtTheme.titleMediumFont),
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.png"),
          radius: 12,
        ),
        Text(" Elaine ", style: txtTheme.titleMediumFont),
      ],
    );
  }
}
