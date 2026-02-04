import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/di/injection_container.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../../core/presentation/routes/config/app_state_notifier.dart';
import '../../../../../../../core/presentation/routes/route_names.dart';
import '../../../../../../auth/domain/use_cases/logout_use_case.dart';
import '../../../../../domain/entity/employee_profile.dart';
import '../profile_container.dart';

class ProfileSettingsSection extends StatelessWidget {
  final EmployeeProfile profile;

  const ProfileSettingsSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileContainer(
      title: 'settings'.tr(),
      profileItems: [
        ProfileItem.action(
          title: 'change_password'.tr(),
          icon: Iconsax.lock,
          onTap: () => {},
        ),
        ProfileItem.action(
          title: 'versioning'.tr(),
          icon: Iconsax.info_circle,
          onTap: () => _showVersionDialog(context),
        ),
        ProfileItem.action(
          title: 'faq_help'.tr(),
          icon: Iconsax.message_question,
          onTap: () => {},
        ),
        ProfileItem.danger(
          title: 'logout'.tr(),
          icon: Iconsax.logout,
          onTap: () => _showLogoutDialog(context),
        ),
      ],
    );
  }
}

void _showVersionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text('app_version'.tr()),
      content: const Text('Version 1.0.0'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('ok'.tr()),
        ),
      ],
    ),
  );
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text('logout'.tr()),
      content: Text('logout_confirmation'.tr()),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: Text('cancel'.tr()),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(dialogContext);

            final result = await sl<LogoutUseCase>().call();
            result.fold(
                  (failure) {
                if (context.mounted) {
                  SnackBarHelper.showError(context, failure.message);
                }
              },
                  (_) {
                AuthStateNotifier.instance.setLoggedOut();
                if (context.mounted) {
                  context.go(RouteNames.login);
                }
              },
            );
          },
          child: Text(
            'logout'.tr(),
            style: TextStyle(color: context.colors.error),
          ),
        ),
      ],
    ),
  );
}

