import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/employee_profile.dart';

class ProfileHeader extends StatelessWidget {
  final EmployeeProfile profile;
  final bool isUploadingImage;
  final VoidCallback onImageTap;

  const ProfileHeader({
    super.key,
    required this.profile,
    required this.isUploadingImage,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.colors.purple500,
            context.colors.purple600,
            context.colors.purple700,
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),

          // Profile Image
          GestureDetector(
            onTap: isUploadingImage ? null : onImageTap,
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: isUploadingImage
                        ? Center(
                      child: CircularProgressIndicator(
                        color: context.colors.purple500,
                      ),
                    )
                        : CachedNetworkImage(
                      imageUrl: profile.profileImage ?? '',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: context.colors.purple500,
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AppAssets.placeHolderProfile,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Edit Icon
                if (!isUploadingImage)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: context.colors.purple500,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.colors.white,
                          width: 3,
                        ),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: context.colors.white,
                        size: 18,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Name + Verified Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                profile.fullName,
                style: context.textTheme.titleLargeFont.copyWith(
                  color: context.colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              if (profile.isActive)
                Icon(
                  Icons.verified,
                  color: context.colors.white,
                  size: 24,
                ),
            ],
          ),

          const SizedBox(height: 4),

          // Job Title
          Text(
            profile.displayJobTitle,
            style: context.textTheme.bodyMediumFont.copyWith(
              color: context.colors.white.withOpacity(0.9),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}