import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesService {
  Future<void> setString({required String key, required String value});
  Future<String?> getString({required String key});
  Future<void> setBool({required String key, required bool value});
  Future<bool?> getBool({required String key});
  Future<void> setInt({required String key, required int value});
  Future<int?> getInt({required String key});
  Future<void> remove({required String key});
  Future<void> clearAll();
}


class SharedPreferencesServiceImpl implements PreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesServiceImpl(this._prefs);

  @override
  Future<void> setString({required String key, required String value}) async {
    await _prefs.setString(key, value);
  }

  @override
  Future<String?> getString({required String key}) {
    return Future.value(_prefs.getString(key));
  }

  @override
  Future<void> setBool({required String key, required bool value}) async {
    await _prefs.setBool(key, value);
  }

  @override
  Future<bool?> getBool({required String key}) {
    return Future.value(_prefs.getBool(key));
  }

  @override
  Future<void> setInt({required String key, required int value}) async {
    await _prefs.setInt(key, value);
  }

  @override
  Future<int?> getInt({required String key}) {
    return Future.value(_prefs.getInt(key));
  }

  @override
  Future<void> remove({required String key}) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clearAll() async {
    await _prefs.clear();
  }
  
  

  // //save data
  // static Future<bool> setString(String key, String value) async {
  //   return await shared?.setString(key, value) ?? false;
  // }
  //
  // static Future<bool> setInt(String key, int value) async {
  //   return await shared?.setInt(key, value) ?? false;
  // }
  //
  // static Future<bool> setBool(String key, bool value) async {
  //   return await shared?.setBool(key, value) ?? false;
  // }
  //
  // static Future<bool> setDouble(String key, double value) async {
  //   return await shared?.setDouble(key, value) ?? false;
  // }
  //
  // static Future<bool> setStringList(String key, List<String> value) async {
  //   return await shared?.setStringList(key, value) ?? false;
  // }
  //
  // //get data
  // static String getString(String key, {String defaultValue = ""}) {
  //   return shared?.getString(key) ?? defaultValue;
  // }
  //
  // static int getInt(String key, {int defaultValue = 0}) {
  //   return shared?.getInt(key) ?? defaultValue;
  // }
  //
  // static bool getBool(String key, {bool defaultValue = false}) {
  //   return shared?.getBool(key) ?? defaultValue;
  // }
  //
  // static double getDouble(String key, {double defaultValue = 0.0}) {
  //   return shared?.getDouble(key) ?? defaultValue;
  // }
  //
  // static List<String> getStringList(
  //   String key, {
  //   List<String> defaultValue = const [],
  // }) {
  //   return shared?.getStringList(key) ?? defaultValue;
  // }
  //
  // //remove data
  // static Future<void> remove(String key) async {
  //   if (shared != null) {
  //     await shared!.remove(key);
  //   }
  // }
  //
  // //clear all data
  // static Future<void> clear() async {
  //   if (shared != null) {
  //     await shared!.clear();
  //   }
  // }
}
