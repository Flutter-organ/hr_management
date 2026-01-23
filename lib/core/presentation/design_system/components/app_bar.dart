import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/extention_colors.dart';
import '../theme/helper/theme_extention.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // For standard mode
  final String? title;
  final bool showBackButton;
  final  VoidCallback? onBackPressed;


  // For profile mode
  final String? profileName;
  final String? profileJobTitle;
  final String? profileAvatarUrl;
  final VoidCallback? onChatPressed;
  final VoidCallback? onBellPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.profileName,
    this.profileJobTitle,
    this.profileAvatarUrl,
    this.onChatPressed,
    this.onBellPressed,
  });

  bool get isProfileMode => profileName != null;
  @override
  Widget build(BuildContext context) {
      final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:isProfileMode? 12 : 24),
      child: AppBar(
        backgroundColor:colors.surface,
        automaticallyImplyLeading: false,
      leading: showBackButton && !isProfileMode
      ? SizedBox(    
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: colors.purple500,
              ),
              onPressed: onBackPressed,
              style: IconButton.styleFrom(
                backgroundColor: colors.purple50,
                shape: const CircleBorder(),
                fixedSize: const Size(32, 32), 
              ),
            )
      )
      : null,
        title: isProfileMode
            ? Row(
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: profileAvatarUrl ?? '',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: (context, url) => Image.asset(
                          AppAssets.placeHolderProfile,
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          AppAssets.placeHolderProfile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            profileName ?? "Username".tr(),
                            style: context.textTheme.titleMediumFont.copyWith(
                                color:  ExtensionColors.purpleProfile
                            )
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                              Icons.verified,
                              color:ExtensionColors.purpleProfile,
                              size: 20
                          ),
                        ],
                      ),
                      Text(
                        profileJobTitle ?? "job_title".tr(),
                        style: context.textTheme.labelMediumFont.copyWith(
                          color: ExtensionColors.purpleProfile,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : title != null
                ? Text(
                    title!,
                    style: context.textTheme.navbarTitleFont.copyWith(
                        color: colors.textPrimary
                    )
                  )
                : null,
        centerTitle: !isProfileMode,
        actions: isProfileMode
            ? [
                IconButton(
              icon: Icon(
                Icons.chat_bubble_outline,
                size: 18,
                color: colors.purple500,
              ),
              onPressed: onChatPressed,
              style: IconButton.styleFrom(
                backgroundColor: colors.purple50,
                shape: const CircleBorder(),
                fixedSize: const Size(44, 44),
              ),
            ),
             const SizedBox(width: 8),
                IconButton(
              icon: Icon(
                Icons.notifications,
                size: 18,
                color: colors.purple500,
              ),
              onPressed: onBellPressed,
              style: IconButton.styleFrom(
                backgroundColor: colors.purple50,
                shape: const CircleBorder(),
                fixedSize: const Size(44, 44),
              ),
            ),
              ]
            : null, 
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

