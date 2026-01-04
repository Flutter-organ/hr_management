import 'package:hr_management/SharedPreferencesService/shared_preferences_service.dart';
import 'package:hr_management/SharedPreferencesService/shared_prefs_keys.dart';

class OnboardingCache {
  static Future<bool> setOnboardingCompleted() async {
    return await SharedPreferencesService.setBool(
      SharedPreferencesKeys.onboardingCompleted,
      true,
    );
  }

  static bool isOnboardingCompleted() {
    return SharedPreferencesService.getBool(
      SharedPreferencesKeys.onboardingCompleted,
      defaultValue: false,
    );
  }
}
