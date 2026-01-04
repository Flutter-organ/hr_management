import 'package:hr_management/SharedPreferencesService/shared_preferences_service.dart';
import 'package:hr_management/SharedPreferencesService/shared_prefs_keys.dart';

class ThemeCache {
  static Future<bool> setThemeMode(String theme) async {
    return await SharedPreferencesService.setString(
      SharedPreferencesKeys.themeMode,
      theme,
    );
  }

  static String getThemeMode() {
    return SharedPreferencesService.getString(
      SharedPreferencesKeys.themeMode,
      defaultValue: "light",
    );
  }
}
