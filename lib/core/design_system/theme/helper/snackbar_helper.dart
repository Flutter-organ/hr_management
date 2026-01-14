import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

class SnackBarHelper {
  SnackBarHelper._();

  static void showError(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 2),
      }) {
    _show(
      context,
      message: message,
      backgroundColor: context.colors.error,
      icon: Icons.error_outline,
      duration: duration,
    );
  }

  static void showSuccess(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 2),
      }) {
    _show(
      context,
      message: message,
      backgroundColor: context.colors.success25,
      icon: Icons.check_circle_outline,
      duration: duration,
    );
  }

  static void showInfo(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 2),
      }) {
    _show(
      context,
      message: message,
      backgroundColor: context.colors.purple500,
      icon: Icons.info_outline,
      duration: duration,
    );
  }

  static void _show(
      BuildContext context, {
        required String message,
        required Color backgroundColor,
        required IconData icon,
        Duration duration = const Duration(seconds: 2),
      }) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: duration,
      ),
    );
  }
}