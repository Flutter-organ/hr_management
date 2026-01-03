import 'package:hr_management/core/cashe/secure_storage_data_source.dart';

abstract class SecureRepository {
  Future<void> setSecretData(String key, String value);
  Future<String?> getSecretData(String key);
  Future<void> clearAll();
  Future<void> setToken(String token);
}

class SecureRepositoryImpl implements SecureRepository {
  final SecureDataSource dataSource;

  SecureRepositoryImpl(this.dataSource);

  @override
  Future<void> setSecretData(String key, String value) async {
    await dataSource.saveData(key: key, value: value);
  }

  @override
  Future<String?> getSecretData(String key) async {
    return await dataSource.getData(key: key);
  }

  @override
  Future<void> clearAll() async {
    await dataSource.deleteAll();
  }

  @override
  Future<void> setToken(String token) async {
    await dataSource.saveToken(token: token);
  }
}
