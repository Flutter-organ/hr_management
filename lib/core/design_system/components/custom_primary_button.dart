import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String title;
  final BoxBorder? border;
  final double? spaceBetween, width;
  final TextAlign? textAlign;
  final Color backGroundColor;
  final Color? circularColor;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final TextStyle? style;
  final bool isLoading;
  final void Function()? onTap;
  const CustomPrimaryButton({
    super.key,
    required this.title,
    required this.backGroundColor,
    this.margin,
    this.gradient,
    this.style,
    this.onTap,
    this.padding,
    this.isLoading = false,
    this.border,
    this.borderRadius,
    this.textAlign = TextAlign.center,
    this.circularColor,
    this.spaceBetween,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: backGroundColor,
          border: border,
          borderRadius: borderRadius,
          gradient: gradient,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: circularColor,
                      strokeWidth: 1.5,
                    ),
                  )
                : SizedBox(),
            SizedBox(width: isLoading ? spaceBetween : 0),
            Text(title, textAlign: textAlign, style: style),
          ],
        ),
      ),
    );
  }
}
