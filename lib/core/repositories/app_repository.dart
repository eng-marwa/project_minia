import '../data/local/preference_helper.dart';

class AppRepository {
  final PreferenceHelper _prefs;

  AppRepository(this._prefs);

  Future<bool> isSeen() async {
    return await _prefs.isSeen();
  }

  Future<bool> isLoggedIn() async {
    return await _prefs.isLoggedIn();
  }

  Future<void> setSeen(bool value) async {
    await _prefs.setSeen(value);
  }

  Future<void> setLoggedIn(bool value) async {
    await _prefs.setLoggedIn(value);
  }
}
