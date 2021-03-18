import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  SharedPreferences _prefs;

  Preferences() {
    load();
  }

  Future load() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
  }
}