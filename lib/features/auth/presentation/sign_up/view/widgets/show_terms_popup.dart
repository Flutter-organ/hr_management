import 'package:flutter/material.dart';
import 'terms_popup.dart';

void showTermsPopup(BuildContext context, VoidCallback onAgree) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) {
      return TermsPopup(onAgree: onAgree);
    },
  );
}