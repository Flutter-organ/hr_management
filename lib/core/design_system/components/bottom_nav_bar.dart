import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/extention_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  final Function(int) onTap;
  const BottomNavBar({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = context.colors;

    final List<IconData> notSelectedIcons = [
      Iconsax.home,
      Iconsax.calendar_2,
      Iconsax.note_text,
      Iconsax.receipt_2,
      Iconsax.layer,
    ];
    final List<IconData> selectedIcons = [
      Iconsax.home_15,
      Iconsax.calendar_25,
      Iconsax.note_text5,
      Iconsax.receipt_21,
      Iconsax.layer5,
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 75),
      decoration: BoxDecoration(color: ExtensionColors.bottomNavBarBgColor),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: List.generate(selectedIcons.length, (idx) {
          bool isSelected = index == idx;
          return InkWell(
            onTap: () => onTap(idx),
            child: Column(
              children: [
                Icon(
                  isSelected ? selectedIcons[idx] : notSelectedIcons[idx],
                  color: color.pureWhite,
                ),
                const SizedBox(height: 5),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: isSelected ? 1.0 : 0.0,
                  child: Container(
                    width: 12,
                    height: 2,
                    decoration: BoxDecoration(
                      color: color.pureWhite,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
