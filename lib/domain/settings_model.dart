import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  bool _isDarkThemeEnabled = false;

  SettingsModel(this._isDarkThemeEnabled);

  set isDarkThemeEnabled(bool value) {
    _isDarkThemeEnabled = value;
    notifyListeners();
  }

  bool get isDarkThemeEnabled => _isDarkThemeEnabled;
}