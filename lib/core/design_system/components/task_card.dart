import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/task_status.dart';
import 'package:hr_management/core/design_system/components/taskpriority.dart';

import '../theme/helper/app_assets.dart';
import '../theme/helper/extention_colors.dart';
import '../theme/helper/theme_extention.dart';
import 'custom_btn_low_high_medium.dart';
import 'horizontal_stacked_avatars.dart';

class TaskState extends StatelessWidget{
  final String title;
  final TaskPriority priority;
  final TaskStatus status;
  final String date;

  const TaskState(
      {
        super.key,
        required this.title,
        required this.priority,
        required this.status,
        required this.date,
      });
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TaskCardItem extends StatelessWidget {
  final TaskState taskState;

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
                style: context.textTheme.bodySmallFont
                    .copyWith(color: context.colors.black),
              ),
            ],
          ),
          Row(
            children: [
              CustomBtnLowHighMedium(
                title:taskState.status.name,
                color: taskState.status.colorStatus,
                style: context.textTheme.bodySmallFont
                    .copyWith(color: context.colors.gray600),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                borderRadius: BorderRadius.circular(100),
                image:taskState.status.iconStatus,
              ),
              const SizedBox(width: 8),
              CustomBtnLowHighMedium(
                title: taskState.priority.name,
                color: taskState.priority.colorTaskPriority,
                style: context.textTheme.bodySmallFont
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
                  HorizontalStackedAvatars(),
                  Text(
                    "+3",
                    style: context.textTheme.bodySmallFont
                        ?.copyWith(color: context.colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomBtnLowHighMedium(
                    title: taskState.date,
                    color: context.colors.white,
                    style: context.textTheme.bodySmallFont
                        .copyWith(color: context.colors.black),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    borderRadius: BorderRadius.circular(100),
                    image: AppAssets.calendar,
                  ),
                  const SizedBox(width: 6),
                  CustomBtnLowHighMedium(
                    title: "2",
                    color: context.colors.white,
                    style: context.textTheme.bodySmallFont
                        .copyWith(color: context.colors.black),
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
