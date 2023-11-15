import 'package:eden_app_test/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(kToken).toString();
  }

  static Future saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(kToken, token);
  }
}
