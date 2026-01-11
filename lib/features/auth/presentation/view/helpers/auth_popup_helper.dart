import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPopupHelper {
  AuthPopupHelper._();

  static Future<T?> showAuthPopup<T>({
    required BuildContext context,
    required Widget popup,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: popup,
      ),
    );
  }
}