import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/task_card.dart';

import '../theme/helper/extention_colors.dart';
import '../theme/helper/theme_extention.dart';


class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String count;
  final TaskState taskState;
  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.count,
    required this.taskState,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          _TaskCardHeader(
            title: title,
            subtitle: subtitle,
            count: count,
          ),
          TaskCardItem(taskState: taskState),
        ],
      ),
    );
  }
}

class _TaskCardHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String count;

  const _TaskCardHeader({
    required this.title,
    required this.subtitle,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: context.textTheme.titleMediumFont),
            const SizedBox(width: 4),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: context.colors.purple50,
              ),
              child: Center(
                child: Text(
                  count,
                  style: context.textTheme.bodySmallFont
                      .copyWith(color: context.colors.purple500),
                ),
              ),
            ),
          ],
        ),
        Text(
          subtitle,
          style: context.textTheme.bodySmallFont
              .copyWith(color: ExtentionColors.textSecondary),
        ),
      ],
    );
  }
}

