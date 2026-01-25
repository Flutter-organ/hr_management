import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/extention_colors.dart';
import '../theme/helper/theme_extention.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Standard mode
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  // Profile mode
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
      padding: EdgeInsets.symmetric(horizontal: isProfileMode ? 12 : 24),
      child: AppBar(
        backgroundColor: colors.surface,
        automaticallyImplyLeading: false,
        leading: _buildLeading(context),
        title: _buildTitle(context),
        centerTitle: !isProfileMode,
        actions: _buildActions(context),
      ),
    );
  }

  Widget? _buildLeading(BuildContext context) {
    final colors = context.colors;
    if (showBackButton && !isProfileMode) {
      return SizedBox(
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
        ),
      );
    }
    return null;
  }

  Widget? _buildTitle(BuildContext context) {
    final colors = context.colors;

    if (isProfileMode) {
      return Row(
        children: [
          _buildProfileAvatar(),
          const SizedBox(width: 9),
          _buildProfileInfo(context),
        ],
      );
    }

    if (title != null) {
      return Text(
        title!,
        style: context.textTheme.navbarTitleFont.copyWith(
          color: colors.textPrimary,
        ),
      );
    }

    return null;
  }

  /// Build profile avatar widget
  Widget _buildProfileAvatar() {
    return CircleAvatar(
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
    );
  }

  Widget _buildProfileInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              profileName ?? "Username".tr(),
              style: context.textTheme.titleMediumFont.copyWith(
                color: ExtensionColors.purpleProfile,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.verified,
              color: ExtensionColors.purpleProfile,
              size: 20,
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
    );
  }

  List<Widget>? _buildActions(BuildContext context) {
    if (!isProfileMode) return null;

    final colors = context.colors;

    return [
      _buildActionButton(
        icon: Icons.chat_bubble_outline,
        onPressed: onChatPressed,
        backgroundColor: colors.purple50,
      ),
      const SizedBox(width: 8),
      _buildActionButton(
        icon: Icons.notifications,
        onPressed: onBellPressed,
        backgroundColor: colors.purple50,
      ),
    ];
  }

  Widget _buildActionButton({
    required IconData icon,
    VoidCallback? onPressed,
    required Color backgroundColor,
  }) {
    return IconButton(
      icon: Icon(icon, size: 18, color: Colors.purple),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const CircleBorder(),
        fixedSize: const Size(44, 44),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
