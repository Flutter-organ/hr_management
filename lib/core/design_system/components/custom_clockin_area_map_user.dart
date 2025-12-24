import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/design_system/theme/helper/extention_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

class CustomClockinAreaMapUser extends StatelessWidget {
  final String imageUrl;
  final void Function()? onTap;
  const CustomClockinAreaMapUser({
    super.key,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(83),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.purple100,
        border: Border.all(color: ExtensionColors.kTwo),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: context.colors.purple500, width: 3),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: 56,
            height: 56,
            errorWidget: (context, url, error) =>
                ClipOval(child: Image.asset(AppAssets.profilePlaceholder)),
          ),
        ),
      ),
    );
  }
}
