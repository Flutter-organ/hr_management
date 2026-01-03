import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureDataSource {
  Future<void> saveData({required String key, required String value});
  Future<void> saveToken({required String token});
  Future<String?> getData({required String key});
  Future<String?> getToken();
  Future<void> deleteData({required String key});
  Future<void> deleteAll();
}

class SecureStorageService implements SecureDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> saveData({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<void> saveToken({required String token}) async {
    await _storage.write(key: 'user_token', value: token);
  }

  @override
  Future<String?> getData({required String key}) async {
    return await _storage.read(key: key);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: 'user_token');
  }

  @override
  Future<void> deleteData({required String key}) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}