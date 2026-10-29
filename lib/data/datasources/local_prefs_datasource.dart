import 'package:shared_preferences/shared_preferences.dart';

class LocalPrefsDataSource {
  LocalPrefsDataSource(this._prefs);

  final SharedPreferences _prefs;

  static const _onboardingKey = 'onboarding_completed';

  bool getOnboardingComplete() => _prefs.getBool(_onboardingKey) ?? false;

  Future<void> setOnboardingComplete() => _prefs.setBool(_onboardingKey, true);
}
