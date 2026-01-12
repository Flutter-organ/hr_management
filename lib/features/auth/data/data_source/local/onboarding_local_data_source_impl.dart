import 'package:hr_management/core/cache/shared_preferences_service.dart';
import 'package:hr_management/features/auth/data/data_source/local/onboarding_local_data_source%20.dart';

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final PreferencesService prefs;

  static const _key = 'onboarding_completed';

  OnboardingLocalDataSourceImpl(this.prefs);

  @override
  Future<void> saveOnboardingCompleted() async {
    await prefs.setBool(key: _key, value: true);
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    return await prefs.getBool(key: _key) ?? false;
  }
}
