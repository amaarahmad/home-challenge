import 'package:flutter/material.dart';
import 'package:home_challenge_kanban_task/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  Color _backgroundColor = taskBgColor;
  bool _initialized = false;  // To track if initialization is complete

  Color get backgroundColor => _backgroundColor;
  bool get isInitialized => _initialized;  // Expose initialization status

  Future<void> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int colorValue = prefs.getInt('backgroundColor') ?? taskBgColor.value;
    _backgroundColor = Color(colorValue);
    _initialized = true;
    print("SharedPreferences initialized.");

    notifyListeners();
  }

  void setBackgroundColor(Color color) async {
    _backgroundColor = color;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('backgroundColor', color.value);
    notifyListeners();
  }
}
