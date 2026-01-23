import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hr_management/features/auth/presentation/sign_up/view/widgets/show_terms_popup.dart';
import '../../../../../../core/presentation/design_system/components/check_box.dart';
import '../../../../../../core/presentation/design_system/theme/color/app_constant_colors.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';



Widget buildTermsAndConditions(
    BuildContext context,
    {
      required bool isChecked,
      required ValueChanged<bool> onChanged,
    })
{
  final defaultStyle = context.textTheme.labelMediumFont.copyWith(
    color: context.colors.textPrimary,
  );

  final linkStyle = defaultStyle.copyWith(
    color: AppConstantColors.purple500,
  );
  final cubit = context.read<SignUpCubit>();
  return BlocBuilder<SignUpCubit, SignUpUiState>(
    buildWhen: (previous, current) => current.isCheckedTermAndConditions!=previous.isCheckedTermAndConditions,
    builder: (context, state) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCheckbox(
            size: 16,
            isChecked:  cubit.state.isCheckedTermAndConditions,
            onChanged: (value) {
              cubit.onToggleTerms(value);
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: defaultStyle,
                children: [
                  TextSpan(text: "agree_with".tr()),
                  TextSpan(
                    text: "terms_conditions".tr(),
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showTermsPopup(context, () {
                          cubit.onToggleTerms(true);
                        });
                      },
                  ),
                  TextSpan(text: "and".tr()),
                  TextSpan(
                      text: "privacy_policy".tr(),
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                  ),
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    },
  );
}
