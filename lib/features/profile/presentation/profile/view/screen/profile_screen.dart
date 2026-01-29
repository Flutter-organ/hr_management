import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/profile_cubit.dart';
import '../../logic/profile_state.dart';
import '../widget/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: CustomAppBar(
        title: 'my_profile'.tr(),
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.error != null && !state.isProfileNotCompleted) {
            SnackBarHelper.showError(context, state.error!);
          }

          // TODO: Show complete profile popup if not completed
          if (state.isProfileNotCompleted) {
            // Will implement in next step
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.profile == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: context.colors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.error ?? 'Failed to load profile',
                    style: context.textTheme.bodyLargeFont,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<ProfileCubit>().getProfile(),
                    child: Text('retry'.tr()),
                  ),
                ],
              ),
            );
          }

          final profile = state.profile!;

          return RefreshIndicator(
            onRefresh: () => context.read<ProfileCubit>().refreshProfile(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Header
                  ProfileHeader(
                    profile: profile,
                    isUploadingImage: state.isUploadingImage,
                    onImageTap: () {
                      _showImagePicker(context);
                    },
                  ),

                  const SizedBox(height: 24),

                  // Contact Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    //child: ProfileContactSection(profile: profile),
                  ),

                  const SizedBox(height: 24),

                  // Account Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    //child: ProfileAccountSection(profile: profile),
                  ),

                  const SizedBox(height: 24),

                  // Settings Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    //child: const ProfileSettingsSection(),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showImagePicker(BuildContext context) {
    // TODO: Implement image picker
    SnackBarHelper.showInfo(context, 'Image picker coming soon');
  }
}