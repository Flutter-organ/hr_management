import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveData({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> saveToken({required String token}) async {
    await _storage.write(key: 'user_token', value: token);
  }

  Future<String?> getData({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'user_token');
  }

  Future<void> deleteData({required String key}) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
