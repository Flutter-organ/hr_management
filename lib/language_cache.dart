import 'package:hr_management/SharedPreferencesService/shared_preferences_service.dart';
import 'package:hr_management/SharedPreferencesService/shared_prefs_keys.dart';

class LanguageCache {
  static Future<bool> setLanguage(String language) async {
    return await SharedPreferencesService.setString(
      SharedPreferencesKeys.language,
      language,
    );
  }

  static String getLanguage() {
    return SharedPreferencesService.getString(
      SharedPreferencesKeys.language,
      defaultValue: "en",
    );
  }
}
