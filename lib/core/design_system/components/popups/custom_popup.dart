import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/theme/color/app_constant_colors.dart';
import 'package:pinput/pinput.dart';

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
  factory CustomPopup.phoneauthpopup({
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
      content: Column(
        children: [
          Pinput(
            length: 6,
            onCompleted: onCompleted,
            defaultPinTheme: PinTheme(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Haven't received the sign in code? ",
                style: TextStyle(color: AppConstantColors.black),
              ),
              GestureDetector(
                onTap: onTapResend,
                child: Text(
                  "Resend it",
                  style: TextStyle(color: AppConstantColors.purple500),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),

      primaryButtonText: primaryButtonText,
      primaryButtonOnPressed: primaryButtonOnPressed,
    );
  }
  factory CustomPopup.verificationpopup({
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

      content: Column(
        children: [
          Pinput(
            length: 6,
            onCompleted: onCompleted,
            defaultPinTheme: PinTheme(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: AppConstantColors.black, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive the code? ",
                style: TextStyle(color: AppConstantColors.black),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Resend",
                  style: TextStyle(color: AppConstantColors.purple500),
                ),
              ),
            ],
          ),
        ],
      ),
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
          padding: EdgeInsets.fromLTRB(20, 60, 20, 20),

          decoration: BoxDecoration(
            color: AppConstantColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              SizedBox(height: 8),
              Text(description),
              if (content != null) ...[SizedBox(height: 16), content!],
              SizedBox(height: 24),
              CustomPrimaryButton(title: primaryButtonText),
              if (secondaryButtonText != null) ...[
                SizedBox(height: 8),
                CustomPrimaryButton(
                  onTap: secondaryButtonOnPressed,
                  title: secondaryButtonText!,
                ),
              ],
              if (showFooter) ...[
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in with different method",
                      style: TextStyle(color: AppConstantColors.black),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      child: Text(
                        "Here",
                        style: TextStyle(color: AppConstantColors.purple500),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        Positioned(
          top: -50,

          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppConstantColors.purple500,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppConstantColors.purple500,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: AppConstantColors.white, size: 40),
          ),
        ),
      ],
    );
  }
}
