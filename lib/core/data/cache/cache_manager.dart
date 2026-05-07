import 'package:hr_management/core/data/cache/preferences_keys.dart';
import 'package:hr_management/core/data/cache/secure_storage_data_source.dart';
import 'package:hr_management/core/data/cache/shared_preferences_service.dart';

abstract class CacheManager {
  Future<void> clearAllCache();
}

class CacheManagerImpl implements CacheManager {
  final PreferencesService _preferencesService;
  final SecureStorageService _secureStorageService;

  const CacheManagerImpl({
    required PreferencesService preferencesService,
    required SecureStorageService secureStorageService,
  })  : _preferencesService = preferencesService,
        _secureStorageService = secureStorageService;

  @override
  Future<void> clearAllCache() async {
    final onboardingCompleted = _preferencesService.getBool(
      key: PreferencesKeys.onboardingCompleted,
    );

    await _preferencesService.clear();

    if (onboardingCompleted != null) {
      await _preferencesService.setBool(
        key: PreferencesKeys.onboardingCompleted,
        value: onboardingCompleted,
      );
    }

    await _secureStorageService.deleteAll();
  }
}