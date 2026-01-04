import 'package:hr_management/SharedPreferencesService/shared_preferences_service.dart';
import 'package:hr_management/SharedPreferencesService/shared_prefs_keys.dart';

class LoginCache {
  static Future<bool> setIsLoggedIn(bool status) async {
    return await SharedPreferencesService.setBool(
      SharedPreferencesKeys.isLoggedIn,
      status,
    );
  }

  static bool getIsLoggedIn() {
    return SharedPreferencesService.getBool(
      SharedPreferencesKeys.isLoggedIn,
      defaultValue: false,
    );
  }
}
