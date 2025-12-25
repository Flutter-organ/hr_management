import 'package:flutter/material.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/extention_colors.dart';

enum TaskStatus {
  inProgress,
  review,
  done;

  Color get colorStatus => switch (this) {
    TaskStatus.inProgress => ExtentionColors.gray200,
    TaskStatus.review => ExtentionColors.yellow50,
    TaskStatus.done => ExtentionColors.green50
  };
  String get name => switch (this) {
    TaskStatus.inProgress => "In Progress",
    TaskStatus.review => "Review",
    TaskStatus.done => "Done"
  };
  String get iconStatus =>switch (this) {
    TaskStatus.inProgress => AppAssets.taskStutasInProgrss,
    TaskStatus.review => AppAssets.taskStutasReview,
    TaskStatus.done => AppAssets.taskStutasDone,

  };

  double get status => switch (this) {
    TaskStatus.inProgress => 0.35,
    TaskStatus.review => 0.60,
    TaskStatus.done => 1.0
  };
}
