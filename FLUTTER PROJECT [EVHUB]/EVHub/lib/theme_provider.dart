import 'package:flutter/material.dart';
import 'theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = AppThemes.lightTheme;
  bool _isDarkMode = false;

  ThemeData get currentTheme => _currentTheme;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;
    notifyListeners();
  }
}
