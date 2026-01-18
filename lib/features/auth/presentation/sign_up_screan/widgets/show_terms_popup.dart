import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/design_system/components/popups/terms_popup.dart';
import '../logic/sign_up_cubit.dart';

void showTermsPopup(BuildContext context, VoidCallback onAgree) {
  final cubit = context.read<SignUpCubit>();
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