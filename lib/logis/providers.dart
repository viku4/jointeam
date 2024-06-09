import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeDataProvider themeDataProvider = ThemeDataProvider();
AppLanguageProvider appLanguageProvider = AppLanguageProvider();

class ThemeDataProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get getTheme => _themeMode;
  setTheme(ThemeMode themeMode) {
    log("${themeMode.index}");
    _themeMode = themeMode;
    notifyListeners();
  }
}

class AppLanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale("en");

  Locale get appLocal => _appLocale;
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      return Null;
    }

    _appLocale = Locale(prefs.getString('language_code')!);
    notifyListeners();
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("ne")) {
      _appLocale = const Locale("ne");
      await prefs.setString('language_code', 'ne');
      await prefs.setString('countryCode', 'NE');
    } else {
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}
