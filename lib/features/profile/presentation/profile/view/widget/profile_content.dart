import 'package:flutter/cupertino.dart';
import 'package:hr_management/features/profile/presentation/profile/view/widget/profile_section/profile_account_section.dart';
import 'package:hr_management/features/profile/presentation/profile/view/widget/profile_section/profile_contact_section.dart';
import 'package:hr_management/features/profile/presentation/profile/view/widget/profile_section/profile_settings_section.dart';

import '../../../../domain/entity/employee_profile.dart';

class ProfileContent extends StatelessWidget {
  final EmployeeProfile profile;
  final String? userIdentifier;

  const ProfileContent({
    super.key,
    required this.profile,
    required this.userIdentifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileContactSection(profile: profile,),
        const SizedBox(height: 20),
        ProfileAccountSection(profile: profile),
        const SizedBox(height: 20),
        ProfileSettingsSection(profile: profile),
      ],
    );
  }
}