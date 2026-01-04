import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Implementation of shared preferences service
  static SharedPreferences? shared;
  static Future<void> init() async {
    shared = await SharedPreferences.getInstance();
  }

  //save data
  static Future<bool> setString(String key, String value) async {
    return await shared?.setString(key, value) ?? false;
  }

  static Future<bool> setInt(String key, int value) async {
    return await shared?.setInt(key, value) ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await shared?.setBool(key, value) ?? false;
  }

  static Future<bool> setDouble(String key, double value) async {
    return await shared?.setDouble(key, value) ?? false;
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await shared?.setStringList(key, value) ?? false;
  }

  //get data
  static String getString(String key, {String defaultValue = ""}) {
    return shared?.getString(key) ?? defaultValue;
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return shared?.getInt(key) ?? defaultValue;
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return shared?.getBool(key) ?? defaultValue;
  }

  static double getDouble(String key, {double defaultValue = 0.0}) {
    return shared?.getDouble(key) ?? defaultValue;
  }

  static List<String> getStringList(
    String key, {
    List<String> defaultValue = const [],
  }) {
    return shared?.getStringList(key) ?? defaultValue;
  }

  //remove data
  static Future<void> remove(String key) async {
    if (shared != null) {
      await shared!.remove(key);
    }
  }

  //clear all data
  static Future<void> clear() async {
    if (shared != null) {
      await shared!.clear();
    }
  }
}
