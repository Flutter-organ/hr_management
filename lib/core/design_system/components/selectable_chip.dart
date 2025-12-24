import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

import '../theme/helper/extention_colors.dart';

class SelectableCheckChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? selectedColor;
  final Color? selectedBgColor;

  const SelectableCheckChip({
    super.key,
    required this.label,
    required this.isSelected,
    this.onTap,
    this.selectedColor,
    this.selectedBgColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveSelectedColor = context.colors.purple500;
    final Color effectiveBgSelected = context.colors.purple50;
    final Color effectiveBgUnselected = context.colors.white;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? effectiveBgSelected : effectiveBgUnselected,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? effectiveSelectedColor : ExtentionColors.grayCheckBox,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: context.textTheme.bodyMediumFont.copyWith(
                color:ExtentionColors.grayText,
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? effectiveSelectedColor : context.colors.white,
                border: Border.all(
                  color: isSelected ? effectiveSelectedColor : ExtentionColors.grayCheckBox  ,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                Icons.check,
                size: 14,
                color: Colors.white,
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}