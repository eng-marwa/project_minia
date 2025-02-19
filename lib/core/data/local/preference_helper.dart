import 'package:project_minia/core/di/module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static const String _isLoggedIn = 'is_logged_in';
  static const String _isSeen = 'is_seen';

  final Future<SharedPreferences> _prefs = getIt.getAsync();

  //login
  Future<bool> isLoggedIn() async {
    final prefs = await _prefs;
    return prefs.getBool(_isLoggedIn) ?? false;
  }

  Future<void> setLoggedIn(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_isLoggedIn, value);
  }

  //onboarding
  Future<bool> isSeen() async {
    final prefs = await _prefs;
    return prefs.getBool(_isSeen) ?? false;
  }

  Future<void> setSeen(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(_isSeen, value);
  }
}
