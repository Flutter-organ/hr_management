import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/theme/color/app_constant_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:pinput/pinput.dart';
import '../../theme/helper/app_assets.dart';
import '../../theme/helper/extention_colors.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.content,
    required this.primaryButtonText,
    required this.primaryButtonOnPressed,
    this.secondaryButtonText,
    this.secondaryButtonOnPressed,
    this.onTapHere,
    this.showFooter = false,
  });

  final IconData icon;
  final String title;
  final String description;
  final Widget? content;
  final String primaryButtonText;
  final VoidCallback primaryButtonOnPressed;
  final String? secondaryButtonText;
  final VoidCallback? secondaryButtonOnPressed;
  final VoidCallback? onTapHere;
  final bool showFooter;

  factory CustomPopup.primary({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    String? secondaryButtonText,
    VoidCallback? secondaryButtonOnPressed,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      secondaryButtonText: secondaryButtonText,
      secondaryButtonOnPressed: secondaryButtonOnPressed,
    );
  }

  factory CustomPopup.singleactionpopup({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
    );
  }

  factory CustomPopup.inputfieldpopup({
    required IconData icon,
    required String title,
    required String description,
    required Widget content,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: content,
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
    );
  }

  factory CustomPopup.phoneAuthPopup({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required void Function(String) onCompleted,
    required VoidCallback onTapResend,
    required VoidCallback onTapHere,
    bool showFooter = true,
  }) {
    return CustomPopup(
      showFooter: showFooter,
      icon: icon,
      title: title,
      description: description,
      content: _VerificationContent(
        onCompleted: onCompleted,
        onResend: onTapResend,
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
    );
  }
  factory CustomPopup.ClockOut({
    required IconData icon,
    required String title,
    required String description,
    required String todayWorkHours,
    required String overTimeTodayWorkHours,
    required String primaryButtonText,
    required  primaryButtonOnPressed,
    required String secondaryButtonText,
    required VoidCallback secondaryButtonOnPressed,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content:Row(
        children: [
          Expanded(
            child: ClockOutContent(
              time: "today",
              hour: todayWorkHours,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: ClockOutContent(
              time: "overtime",
              hour: overTimeTodayWorkHours,
            ),
          ),
        ],
      ),
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
      secondaryButtonText: secondaryButtonText,
      secondaryButtonOnPressed: secondaryButtonOnPressed,
    );
  }
  factory CustomPopup.verificationPopup({
    required IconData icon,
    required String title,
    required String description,
    required String primaryButtonText,
    required VoidCallback primaryButtonOnPressed,
    required void Function(String) onCompleted,
    required VoidCallback onTap,
  }) {
    return CustomPopup(
      icon: icon,
      title: title,
      description: description,
      content: _VerificationContent(onCompleted: onCompleted, onResend: onTap),
      showFooter: false,
      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 82, 20, 20),
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(context, title),
              const SizedBox(height: 16),
              _buildDescription(context, description),
              const SizedBox(height: 16),
              if (content != null) ...[content!, const SizedBox(height: 16)],
              _buildPrimaryButton(
                context,
                primaryButtonText,
                primaryButtonOnPressed,
              ),
              if (secondaryButtonText != null) ...[
                const SizedBox(height: 16),
                _buildSecondaryButton(
                  context,
                  secondaryButtonText!,
                  secondaryButtonOnPressed,
                ),
              ],
              if (showFooter) ...[
                const SizedBox(height: 16),
                _buildSignInAlternativeFooter(context, onTapHere),
              ],
            ],
          ),
        ),
        _buildTopIconCircle(icon),
      ],
    );
  }
}

Widget _buildTopIconCircle(IconData icon) {
  return Positioned(
    top: -50,
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppConstantColors.purple500,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppConstantColors.purple500.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: AppConstantColors.white, size: 40),
    ),
  );
}

Widget _buildTitle(BuildContext context, String title) {
  return Text(
    title,
    style: context.textTheme.titleLargeFontSemiBold.copyWith(
      color: context.colors.gray500,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget _buildDescription(BuildContext context, String description) {
  return Text(
    description,
    style: context.textTheme.bodySmallFont.copyWith(
      color: context.colors.gray500,
    ),
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start,
  );
}

Widget _buildPrimaryButton(
  BuildContext context,
  String primaryButtonText,
  VoidCallback primaryButtonOnPressed,
) {
  return CustomPrimaryButton.gradient(
    height: 48,
    textStyle: context.textTheme.titleSmallFont.copyWith(
      color: context.colors.white,
    ),
    gradient: LinearGradient(
      colors: [
       ExtensionColors.purpleGradient0,
        ExtensionColors.purpleGradient1,
        ExtensionColors.purpleGradient2,
      ],
    ),
    buttonText: primaryButtonText,
    borderRadius: 100,
    onPressed: primaryButtonOnPressed,
  );
}

Widget _buildSecondaryButton(
  BuildContext context,
  String secondaryButtonText,
  VoidCallback? secondaryButtonOnPressed,
) {
  return CustomPrimaryButton.outlined(
    height: 48,
    textStyle: context.textTheme.titleSmallFont.copyWith(
      color: context.colors.purple600,
    ),
    buttonText: secondaryButtonText!,
    borderColor: context.colors.purple600,
    borderRadius: 100,
    onPressed: secondaryButtonOnPressed,
  );
}

Widget _buildSignInAlternativeFooter(
  BuildContext context,
  VoidCallback? onTapHere,
) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "sign_in_different_method".tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            color: ExtensionColors.textPrimary,
          ),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GestureDetector(
            onTap: onTapHere,
            child: Text(
              "here".tr(),
              style: context.textTheme.labelSmallFont.copyWith(
                color: AppConstantColors.purple500,
              ),
            ),
          ),
        ),
      ],
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
class ClockOutContent extends StatelessWidget {
  ClockOutContent({
    super.key,
    required this.time,
    required this.hour,
  });

  final String time;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.gray300,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colors.gray50, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.taskStatusInProgress,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 10),
              Text(
                time,
                style: context.textTheme.bodySmallFont.copyWith(
                  color: ExtensionColors.textSecondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            hour,
            style: context.textTheme.bodyMediumFont.copyWith(
              color: ExtensionColors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
class _VerificationContent extends StatelessWidget {
  final void Function(String) onCompleted;
  final VoidCallback onResend;

  const _VerificationContent({
    required this.onCompleted,
    required this.onResend,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Pinput(
          length: 6,
          onCompleted: onCompleted,
          defaultPinTheme: PinTheme(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: context.colors.gray200, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          preFilledWidget: Text(
            "0",
            style: context.textTheme.headLineMediumFont.copyWith(
              color: context.colors.gray500,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildResendRow(context),
      ],
    );
  }
  Widget _buildResendRow(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Haven't_received_the_verification_code?".tr(),
            style: context.textTheme.bodySmallFont.copyWith(
              color: ExtensionColors.textPrimary,
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: onResend,
              child: Text(
                "Resend_it".tr(),
                style: context.textTheme.labelSmallFont.copyWith(
                  color: AppConstantColors.purple500,
                ),
              ),
            ),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}