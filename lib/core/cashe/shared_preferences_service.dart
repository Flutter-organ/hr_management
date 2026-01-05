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
  final SharedPreferences sharedPreferences;

  SharedPreferencesServiceImpl(this.sharedPreferences);

  @override
  Future<void> setString({required String key, required String value}) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  Future<String?> getString({required String key}) {
    return Future.value(sharedPreferences.getString(key));
  }

  @override
  Future<void> setBool({required String key, required bool value}) async {
    await sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool?> getBool({required String key}) {
    return Future.value(sharedPreferences.getBool(key));
  }

  @override
  Future<void> setInt({required String key, required int value}) async {
    await sharedPreferences.setInt(key, value);
  }

  @override
  Future<int?> getInt({required String key}) {
    return Future.value(sharedPreferences.getInt(key));
  }

  @override
  Future<void> remove({required String key}) async {
    await sharedPreferences.remove(key);
  }

  @override
  Future<void> clearAll() async {
    await sharedPreferences.clear();
  }
}
