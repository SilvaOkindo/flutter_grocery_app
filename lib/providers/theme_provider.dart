import 'package:flutter/material.dart';
import 'package:grocery_app/services/theme_pref.dart';

class ThemeProvider with ChangeNotifier {
  ThemePref themePref = ThemePref();
  bool _isDark = false;
  bool get getTheme => _isDark;

  set setTheme(bool value) {
    _isDark = value;
    themePref.setDarkTheme(value);
    notifyListeners();
  }
}
