import 'package:flutter/material.dart';

import '../theme/helper/extention_colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton(
      {
        Key? key,
        required this.buttonText,
        required this.onPressedFunction,
        this.buttonBackgroundColor,
        this.onPressedColor,
        this.shadowBackgroundColor,
        this.elevation = 0.0,
        this.width = 343,
        this.height = 48,
        this.iconColor = (ExtensionColors.grayStatusBar),
        this.buttonTextStyle = const TextStyle(
            color: ExtensionColors.whiteContainer
        ),
        this.icon,
        this.radius = 8,
        this.spaceSize = 8.0,
        this.boarderWidth = 1.0,
        this.isLoading = false,
        this.isEnable = true,
        this.showBorder = false,
        this.borderColor = ExtensionColors.whiteContainer, required this.showTextDuringLoading})
      : super(key: key);
  final String buttonText;
  final Function() onPressedFunction;
  final Color? buttonBackgroundColor;
  final Color? onPressedColor;
  final Color? shadowBackgroundColor;
  final double? elevation;
  final double? width;
  final double height;
  final TextStyle? buttonTextStyle;
  final Color? iconColor;
  final double? radius;
  final Widget? icon;
  final double? spaceSize;
  final double? boarderWidth;
  final bool isLoading;
  final bool isEnable;
  final bool showBorder;
  final Color? borderColor;
  final bool showTextDuringLoading;
  @override
  Widget build(BuildContext context) {
    // double getWidgetHeight(double height) {
    //   final double currentHeight = MediaQuery.heightOf(context) * (height / 812);
    //   return currentHeight;
    // }
    //
    // double getWidgetWidth(double width) {
    //   final double currentWidth = MediaQuery.widthOf(context) * (width / 375);
    //   return currentWidth;
    // }
    // final double buttonWidth = getWidgetWidth(width!);
    // final double buttonHeight = getWidgetHeight(height!);
    return  SizedBox(
      width: width ?? double.infinity,
      height: height ,
      child: ElevatedButton(
          onPressed: isLoading || !isEnable ? null : onPressedFunction,
          style: ButtonStyle(
            elevation: WidgetStateProperty.all<double>(elevation!),
            side: WidgetStateProperty.all<BorderSide>(
              BorderSide(
                color: showBorder
                    ? isLoading || !isEnable
                    ? ExtensionColors.yellow50
                    : borderColor!
                    : ExtensionColors.green50,
                width: boarderWidth ?? 1,
              ),
            ),
            shadowColor: WidgetStateProperty.all(
              shadowBackgroundColor ?? ExtensionColors.green50.withOpacity(.3),
            ),
            overlayColor: WidgetStateProperty.all(
              onPressedColor ?? ExtensionColors.red500.withOpacity(.25),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius!),
              ),
            ),
            fixedSize:
            WidgetStateProperty.all<Size>(Size(width ?? double.infinity,height )),
            backgroundColor: isLoading || !isEnable
                ? WidgetStateProperty.all(ExtensionColors.poor)
                : WidgetStateProperty.all(
                buttonBackgroundColor ?? ExtensionColors.gray200),
          ),
            child: Center(
              child: isLoading
                  ? _buildLoadingContent()
                  : _buildNormalContent(),
            )
        ),
    );
  }
  Widget _buildNormalContent() {
    if (icon == null) {
      return Text(
        buttonText,
        style: buttonTextStyle,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon!,
        SizedBox(width: spaceSize),
        Text(
          buttonText,
          style: buttonTextStyle,
        ),
      ],
    );
  }

  Widget _buildLoadingContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(
            strokeWidth: 2.4,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        if (showTextDuringLoading) ...[
          const SizedBox(width: 12),
          Text(
            buttonText,
            style: buttonTextStyle
          ),
        ],
      ],
    );
  }
}