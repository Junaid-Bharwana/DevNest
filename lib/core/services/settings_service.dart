import 'package:flutter/material.dart';

/// Application settings held in memory.
///
/// Deliberately dependency-free: the skeleton only needs the theme-mode setting
/// to prove the theming is wired end to end. Persisting settings (and the ones
/// the dashboard will add) is a later task and slots in behind the same
/// getter/setter pair.
class SettingsService extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  /// The theme the app should render in. Defaults to [ThemeMode.system] so a
  /// fresh install follows the device setting.
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    if (value == _themeMode) {
      return;
    }
    _themeMode = value;
    notifyListeners();
  }
}
