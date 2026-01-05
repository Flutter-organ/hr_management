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
}
