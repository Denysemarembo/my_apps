
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const String themeKey = 'theme';

  static Future<void> setTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(themeKey, theme);
  }

  static Future<String?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(themeKey);
}
}
