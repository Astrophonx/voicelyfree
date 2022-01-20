import 'package:clubroom/app_config/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataLayer {
  LocalDataLayer._privateConstructor() {
    _initPref();
  }

  static final LocalDataLayer _instance = LocalDataLayer._privateConstructor();

  factory LocalDataLayer() => _instance;

  SharedPreferences? _sharedPreferences;

  _initPref() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  static const String _currentLanguageKey = "current_language_key";
  static const String _currentThemeKey = "current_Theme_key";

  Future<String> getCurrentLanguage() async {
    await _initPref();
    return _sharedPreferences!.containsKey(_currentLanguageKey)
        ? _sharedPreferences!.getString(_currentLanguageKey)!
        : AppConfig.defaultLanguage;
  }

  Future<bool> setCurrentLanguage(String langCode) async {
    await _initPref();
    return _sharedPreferences!.setString(_currentLanguageKey, langCode);
  }

  Future<String> getCurrentTheme() async {
    await _initPref();
    return _sharedPreferences!.containsKey(_currentThemeKey)
        ? _sharedPreferences!.getString(_currentThemeKey)!
        : AppConfig.defaultTheme;
  }

  Future<bool> setCurrentTheme(String theme) async {
    await _initPref();
    return _sharedPreferences!.setString(_currentThemeKey, theme);
  }
}
