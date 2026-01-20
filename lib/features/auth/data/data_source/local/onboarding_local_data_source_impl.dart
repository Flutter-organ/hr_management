import 'package:hr_management/core/cache/shared_preferences_service.dart';
import 'package:hr_management/features/auth/data/data_source/local/onboarding_local_data_source%20.dart';

import '../../../../../core/config/preferences_keys.dart';

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final PreferencesService _preferencesService;

  OnboardingLocalDataSourceImpl(this._preferencesService);

  @override
  Future<void> saveOnboardingCompleted() async {
    await _preferencesService.setBool(key: PreferencesKeys.onboardingCompleted, value: true);
  }

  @override
  bool isOnboardingCompleted() {
    return _preferencesService.getBool(key: PreferencesKeys.onboardingCompleted) ?? false;
  }
}
