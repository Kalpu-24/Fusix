import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define theme mode states
abstract class ThemeModeState {}

class ThemeLight extends ThemeModeState {}

class ThemeDark extends ThemeModeState {}

class ThemeSystem extends ThemeModeState {}

// Define a Cubit for managing theme mode
class ThemeCubit extends Cubit<ThemeModeState> {
  ThemeCubit() : super(ThemeSystem()) {
    _loadThemeMode(); // Load the theme mode when the cubit is created
  }

  // Save theme mode to SharedPreferences
  Future<void> _saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode.toString());
  }

  // Load theme mode from SharedPreferences
  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeMode = prefs.getString('themeMode');

    if (themeMode != null) {
      if (themeMode == ThemeMode.light.toString()) {
        emit(ThemeLight());
      } else if (themeMode == ThemeMode.dark.toString()) {
        emit(ThemeDark());
      } else {
        emit(ThemeSystem());
      }
    }
  }

  // Set and save light theme
  void setLightMode() {
    emit(ThemeLight());
    _saveThemeMode(ThemeMode.light);
  }

  // Set and save dark theme
  void setDarkMode() {
    emit(ThemeDark());
    _saveThemeMode(ThemeMode.dark);
  }

  // Set and save system theme
  void setSystemMode() {
    emit(ThemeSystem());
    _saveThemeMode(ThemeMode.system);
  }

  // Get the theme mode based on the current state
  ThemeMode get themeMode {
    if (state is ThemeLight) {
      return ThemeMode.light;
    } else if (state is ThemeDark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}
