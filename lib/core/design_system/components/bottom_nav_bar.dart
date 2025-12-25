import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/extention_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key, required this.index, required this.onTap});
  final Function(int) onTap;
  final int index;
  static final List<IconModel> icons = [
    IconModel(icon: Iconsax.home, activeIcon: Iconsax.home_15),
    IconModel(icon: Iconsax.calendar_2, activeIcon: Iconsax.calendar_25),
    IconModel(icon: Iconsax.note_text, activeIcon: Iconsax.note_text5),
    IconModel(icon: Iconsax.receipt_2, activeIcon: Iconsax.receipt_25),
    IconModel(icon: Iconsax.layer, activeIcon: Iconsax.layer5),
  ];

  @override
  Widget build(BuildContext context) {
    final color = context.colors;
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: ExtensionColors.transparentColor,
        highlightColor: ExtensionColors.transparentColor,
      ),
      child: BottomNavigationBar(
        backgroundColor: ExtensionColors.bottomNavBarBgColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) => onTap(value),
        selectedItemColor: color.pureWhite,
        unselectedItemColor: color.pureWhite,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: icons.map((iconModel) {
          return _buildBottomNavBarItem(iconModel, color, "");
        }).toList(),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem(
    IconModel icons,
    dynamic color,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(icons.icon),
      activeIcon: Column(
        mainAxisSize: .min,
        children: [
          Icon(icons.activeIcon),
          const SizedBox(height: 8),
          Container(
            width: 12,
            height: 2,
            decoration: BoxDecoration(
              color: color.pureWhite,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
      label: label,
    );
  }
}

class IconModel {
  IconData icon, activeIcon;
  IconModel({required this.icon, required this.activeIcon});
}
