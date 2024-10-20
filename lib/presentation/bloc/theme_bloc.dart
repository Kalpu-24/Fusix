import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ThemeModeState { light, dark, system }

class ThemeCubit extends HydratedCubit<ThemeModeState> {
  ThemeCubit() : super(ThemeModeState.system);

  // Toggles between light and dark modes
  void toggleThemeMode() {
    switch (state) {
      case ThemeModeState.light:
        emit(ThemeModeState.dark);
        break;
      case ThemeModeState.dark:
        emit(ThemeModeState.system);
        break;
      case ThemeModeState.system:
        emit(ThemeModeState.light);
        break;
    }
  }

  // Get the current ThemeMode based on the state
  ThemeMode get themeMode {
    switch (state) {
      case ThemeModeState.light:
        return ThemeMode.light;
      case ThemeModeState.dark:
        return ThemeMode.dark;
      case ThemeModeState.system:
        return ThemeMode.system;
    }
  }

  @override
  ThemeModeState? fromJson(Map<String, dynamic> json) {
    return ThemeModeState.values[json['themeMode'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeModeState state) {
    return {'themeMode': state.index};
  }
}
