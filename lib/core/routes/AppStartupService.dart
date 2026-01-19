import '../cache/secure_storage_data_source.dart';
import '../cache/shared_preferences_service.dart';
import '../config/preferences_keys.dart';
import '../network/api_constants.dart';

abstract class AppStartupService {
  bool isOnboardingCompleted();
  Future<bool> isLoggedIn();
}

class AppStartupServiceImpl implements AppStartupService {
  final PreferencesService _prefs;
  final SecureStorageService _secureStorage;

  AppStartupServiceImpl(this._prefs, this._secureStorage);

  @override
  bool isOnboardingCompleted() {
    return _prefs.getBool(key: PreferencesKeys.onboardingCompleted) ?? false;
  }

  @override
  Future<bool> isLoggedIn() async {
    return await _secureStorage.read(key: ApiConstants.tokenKey) != null ? true : false;
  }
}