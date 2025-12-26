import 'package:flutter/material.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/extention_colors.dart';

enum TaskStatus {
  inProgress,
  review,
  done;

  Color get colorStatus => switch (this) {
    TaskStatus.inProgress => ExtensionColors.gray200,
    TaskStatus.review => ExtensionColors.yellow50,
    TaskStatus.done => ExtensionColors.green50
  };
  String get name => switch (this) {
    TaskStatus.inProgress => "In Progress",
    TaskStatus.review => "Review",
    TaskStatus.done => "Done"
  };
  String get iconStatus =>switch (this) {
    TaskStatus.inProgress => AppAssets.taskStatusInProgress,
    TaskStatus.review => AppAssets.taskStatusReview,
    TaskStatus.done => AppAssets.taskStatusDone,

  };

  double get status => switch (this) {
    TaskStatus.inProgress => 0.35,
    TaskStatus.review => 0.60,
    TaskStatus.done => 1.0
  };
}
