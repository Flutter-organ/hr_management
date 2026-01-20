import 'package:hr_management/core/cache/shared_preferences_service.dart';
import '../../../../../core/cache/secure_storage_data_source.dart';
import '../../../../../core/exceptions/app_exception.dart';
import '../../../../../core/network/api_constants.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final SecureStorageService _secureStorageService;
  final PreferencesService _preferencesService;

  const AuthLocalDataSourceImp({
    required SecureStorageService secureStorageService,
    required PreferencesService preferencesService,
  }) : _secureStorageService = secureStorageService,
       _preferencesService = preferencesService;

  @override
  Future<String?> getToken() async {
    try {
      return await _secureStorageService.read(key: ApiConstants.tokenKey);
    } catch (e) {
      throw CacheException(message: 'Failed to read token: $e');
    }
  }

  @override
  Future<void> saveToken(String token) async {
    if (token.isEmpty) {
      throw const CacheException(message: 'Token cannot be empty');
    }
    try {
      await _secureStorageService.write(
        key: ApiConstants.tokenKey,
        value: token,
      );
    } catch (e) {
      throw CacheException(message: 'Failed to save token: $e');
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      await _secureStorageService.delete(key: ApiConstants.tokenKey);
    } catch (e) {
      throw CacheException(message: 'Failed to delete token: $e');
    }
  }

  @override
  Future<bool> hasToken() async {
    try {
      final token = await getToken();
      return token != null && token.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> saveIdentifier(String email) async {
    try {
      await _preferencesService.setString(key: "mail", value: email);
    } catch (e) {
      throw CacheException(message: "Failed to save email : $e");
    }
  }

  @override
  Future<String?> getIdentifier() async {
    try {
      return await _preferencesService.getString(key: "mail");
    } catch (e) {
      throw CacheException(message: "Failed to read mail:$e");
    }
  }



  @override
  Future<void> clearIdentifier() async {
    try {
      return await _preferencesService.remove(key: 'mail');
    } catch (e) {
      throw CacheException(message: "Failed To Remove Mail:$e");
    }
  }
}