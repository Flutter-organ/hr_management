import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // For standard mode
  final String? title;
  final bool showBackButton;

  // For profile mode
  final String? profileName;
  final String? profileJobTitle;
  final String? profileAvatarUrl;
  final VoidCallback? onChatPressed;
  final VoidCallback? onBellPressed;

  const CustomAppBar({
    Key? key,
    this.title,
    this.showBackButton = true,
    this.profileName,
    this.profileJobTitle,
    this.profileAvatarUrl,
    this.onChatPressed,
    this.onBellPressed,
  }) : super(key: key);

  bool get isProfileMode => profileName != null;
  @override
  Widget build(BuildContext context) {
      final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AppBar(
        backgroundColor:colors.surface,
        automaticallyImplyLeading: false,
      leading: showBackButton && !isProfileMode
      ? SizedBox(    
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: colors.primary, 
              ),
              onPressed: () => (){},
              style: IconButton.styleFrom(
                backgroundColor: colors.primaryVariant, 
                shape: const CircleBorder(),
                fixedSize: const Size(32, 32), 
              ),
            ),
          
      )
      : null,
        title: isProfileMode
            ? Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: profileAvatarUrl != null
                        ? NetworkImage(profileAvatarUrl!)
                        : null,
                    child: profileAvatarUrl == null
                        ? const Icon(Icons.person, size: 30, color: Colors.purple)
                        : null,
                  ),
                  const SizedBox(width: 9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            profileName!,
                            style: context.textTheme.titleMediumFont
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.verified, color:Colors.black12, size: 18),
                        ],
                      ),
                      Text(
                        profileJobTitle ?? '',
                        style: context.textTheme.titleSmallFont,
                      ),
                    ],
                  ),
                ],
              )
            : title != null
                ? Text(
                    title!,
                    style: context.textTheme.headLineLargeFont,
                  )
                : null,
        centerTitle: !isProfileMode,
        actions: isProfileMode
            ? [
                IconButton(
              icon: Icon(
                Icons.chat_bubble_outline,
                size: 18,
                color: colors.primary, 
              ),
              onPressed: () => (){},
              style: IconButton.styleFrom(
                backgroundColor: colors.primaryVariant, 
                shape: const CircleBorder(),
                fixedSize: const Size(32, 32), 
              ),
            ),
                IconButton(
              icon: Icon(
                Icons.notifications_off_outlined,
                size: 18,
                color: colors.primary, 
              ),
              onPressed: () => (){},
              style: IconButton.styleFrom(
                backgroundColor: colors.primaryVariant, 
                shape: const CircleBorder(),
                fixedSize: const Size(32, 32), 
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
