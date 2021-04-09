import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  SharedPreferences _prefs;

  Future load() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
  }

  Future setToken(String value) async {
    if (_prefs == null) await load();
    _prefs.setString("token", value);
  }

  Future<String> getToken() async {
    if (_prefs == null) await load();
    return _prefs.getString("token");
  }

  Future setRiderId(int value) async {
    if (_prefs == null) await load();
    print("prefsss");
    print(_prefs);
    _prefs.setInt("riderId", value);
  }

  Future<int> getRiderId() async {
    if (_prefs == null) await load();
    return _prefs.getInt("riderId");
  }
}