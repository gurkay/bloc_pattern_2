import 'package:bloc_pattern_2/bacik/202/cache/shared_not_initiliaze.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter }

class SharedManager {
  SharedPreferences? prefs;

  SharedManager();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void _checkPrefs() {
    if (prefs == null) {
      throw SharedNotInitiliaze();
    }
  }

  Future<void> savePreferences(SharedKeys key, String value) async {
    _checkPrefs();
    await prefs?.setString(key.name, value);
  }

  Future<bool> removePreferences(SharedKeys key) async {
    _checkPrefs();
    return (await prefs?.remove(key.name)) ?? false;
  }

  String? getPreferences(SharedKeys key) {
    _checkPrefs();
    return prefs?.getString(key.name);
  }
}
