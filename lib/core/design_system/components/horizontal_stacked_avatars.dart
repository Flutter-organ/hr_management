import 'package:flutter/material.dart';
import '../theme/helper/app_assets.dart';
class HorizontalStackedAvatars extends StatelessWidget {
  const HorizontalStackedAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 12.0;
    const double overlap = 6.0;

    return SizedBox(
      width: (avatarRadius * 2 * 3) - (overlap * 2),
      height: avatarRadius * 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            child: FunCircleAvatar(
              image: const AssetImage(AppAssets.profilePlaceholder),
            ),
          ),
          Positioned(
            left: avatarRadius * 2 - overlap,
            child: FunCircleAvatar(
              image: const AssetImage(AppAssets.profilePlaceholder),
            ),
          ),
          Positioned(
            left: (avatarRadius * 2 - overlap) * 2,
            child: FunCircleAvatar(
              image: const AssetImage(AppAssets.profilePlaceholder),
            ),
          ),
        ],
      ),
    );
  }
}
class FunCircleAvatar extends StatelessWidget {
  final ImageProvider image;
  final double radius;
  final double borderWidth;

  const FunCircleAvatar({
    super.key,
    required this.image,
    this.radius = 12.0,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: borderWidth,
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: image,
      ),
    );
  }
}
