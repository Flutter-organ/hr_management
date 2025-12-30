import 'package:flutter/material.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/extention_colors.dart';
import '../theme/helper/theme_extention.dart';
import '../model/task_model.dart';
import 'custom_btn_low_high_medium.dart';
import 'horizontal_stacked_avatars.dart';

class TaskCardItem extends StatelessWidget {
  final TaskModel taskState;

  const TaskCardItem({
    super.key,
    required this.taskState,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.gray100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.gray200,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.purple500,
                ),
                child: const Icon(
                  Icons.flash_on,
                  color: Colors.white,
                  size: 12,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                taskState.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.titleSmallFont
                    .copyWith(color: ExtensionColors.cardTitle),
              ),
            ],
          ),
          Row(
            children: [
              CustomBtnLowHighMedium(
                title:taskState.status.name,
                color: taskState.status.colorStatus(context),
                style: context.textTheme.labelMediumFont
                    .copyWith(color: context.colors.gray600),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                borderRadius: BorderRadius.circular(100),
                image:taskState.status.iconStatus,
              ),
              const SizedBox(width: 8),
              CustomBtnLowHighMedium(
                title: taskState.priority.name,
                color: taskState.priority.colorTaskPriority(context),
                style: context.textTheme.labelMediumFont
                    .copyWith(color: context.colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                borderRadius: BorderRadius.circular(100),
                image: AppAssets.kProperty,
              ),
            ],
          ),
          ProgressBar(statusColor: context.colors.purple500,taskStatus:taskState.status.status,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 4,
                children: [
                  HorizontalStackedAvatars(commenterImage: taskState.comments.map((commenterImage) => commenterImage.commenterImage).toList()),
                  Text(
                    taskState.comments.length > 3
                        ? "+${taskState.comments.length - 3}"
                        :'',
                    style: context.textTheme.bodySmallFont
                        .copyWith(color: context.colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomBtnLowHighMedium(
                    title: taskState.date,
                    color: context.colors.white,
                    style: context.textTheme.labelSmallFont
                        .copyWith(color: context.colors.textPrimary),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    borderRadius: BorderRadius.circular(100),
                    image: AppAssets.calendar,
                  ),
                  const SizedBox(width: 6),
                  CustomBtnLowHighMedium(
                    title: taskState.comments.length.toString(),
                    color: context.colors.white,
                    style: context.textTheme.labelSmallFont
                        .copyWith(color: context.colors.textPrimary),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    borderRadius: BorderRadius.circular(100),
                    image: AppAssets.message,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class ProgressBar extends StatelessWidget {
  final Color statusColor;
  final double taskStatus;

  const ProgressBar({
    super.key,
    required this.statusColor,
    required this.taskStatus ,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: LinearProgressIndicator(
        value: taskStatus.clamp(0.0, 1.0),
        backgroundColor: context.colors.gray200,
        borderRadius: BorderRadius.circular(4),
        color: statusColor,
        minHeight: 4,
      ),
    );
  }
}
