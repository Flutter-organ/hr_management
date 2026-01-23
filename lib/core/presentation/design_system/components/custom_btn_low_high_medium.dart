import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBtnLowHighMedium extends StatelessWidget {
  final Color? color;
  final String? image;
  final String title;
  final TextStyle? style;
  final BoxBorder? border;
  final Gradient? gradient;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding, margin;
  const CustomBtnLowHighMedium({
    super.key,
    this.color,
    required this.title,
    this.image,
    this.padding,
    this.margin,
    this.borderRadius,
    this.style,
    this.border,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        border: border,
        borderRadius: borderRadius,
        color: color,
      ),
      child: Row(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null && image!.isNotEmpty) SvgPicture.asset(image!),
          Text(title, style: style),
        ],
      ),
    );
  }
}
