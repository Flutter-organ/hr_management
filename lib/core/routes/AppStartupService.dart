import '../cache/shared_preferences_service.dart';

abstract class AppStartupService {
  bool isOnboardingCompleted();
  bool isLoggedIn();
}

class AppStartupServiceImpl implements AppStartupService {
  final PreferencesService _prefs;

  static const _onboardingKey = 'onboarding_completed';

  AppStartupServiceImpl(this._prefs);

  @override
  bool isOnboardingCompleted() {
    return _prefs.getBool(key: _onboardingKey) ?? false;
  }

  @override
  bool isLoggedIn() {
    return false;
  }
}