import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  SharedPreferences _prefs;

  Preferences() {
    load();
  }

  Future load() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future setSignedIn(bool value) async {
    if (_prefs == null) await load();
    _prefs.setBool("signedIn", value);
  }
  
  Future<bool> getSignedIn() async {
    if (_prefs == null) await load();
    return _prefs.getBool("signedIn");
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
    _prefs.setInt("riderId", value);
  }

  Future<int> getRiderId() async {
    if (_prefs == null) await load();
    return _prefs.getInt("riderId");
  }
}