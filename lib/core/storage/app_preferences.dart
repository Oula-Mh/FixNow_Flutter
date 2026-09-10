import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_keys.dart';

class AppPreferences {
  final SharedPreferences _preferences;

  AppPreferences(this._preferences);

  bool isOnboardingCompleted() {
    return _preferences.getBool(
          AppKeys.onboardingCompleted,
        ) ??
        false;
  }

  Future<void> completeOnboarding() async {
    await _preferences.setBool(
      AppKeys.onboardingCompleted,
      true,
    );
  }
}