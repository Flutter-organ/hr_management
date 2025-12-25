import 'package:flutter/material.dart';

class CustomBtnLowHighMedium extends StatelessWidget {
  final Color? color;
  final IconData? icon;
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
    this.padding,
    this.margin,
    this.borderRadius,
    this.style,
    this.border,
    this.gradient,
    this.icon,
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
          if (icon != null) Icon(icon, size: 10),
          Text(title, style: style),
        ],
      ),
    );
  }
}
