import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../domain/entity/employee_profile.dart';
import '../profile_container.dart';

class ProfileAccountSection extends StatelessWidget {
  final EmployeeProfile profile;

  const ProfileAccountSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileContainer(
      title: 'account'.tr(),
      profileItems: [
        ProfileItem.action(
          title: 'personal_data'.tr(),
          icon: Iconsax.user,
          onTap: () => {},
        ),
        ProfileItem.action(
          title: 'office_assets'.tr(),
          icon: Iconsax.briefcase,
          onTap: () => {},
        ),
        ProfileItem.action(
          title: 'payroll_tax'.tr(),
          icon: Iconsax.wallet_3,
          onTap: () => {},
        ),
      ],
    );
  }
}