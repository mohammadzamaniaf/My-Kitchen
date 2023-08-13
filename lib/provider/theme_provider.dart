import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/constants/styles.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    getThemeMode();
  }

  bool get isDarkMode => state == ThemeMode.dark;

  Future<void> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('is_dark_mode');
    if (isDarkMode != null) {
      state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    } else {
      state = ThemeMode.system;
    }
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    if (isDarkMode) {
      state = ThemeMode.dark;
      await prefs.setBool('is_dark_mode', true);
    } else {
      state = ThemeMode.light;
      await prefs.setBool('is_dark_mode', false);
    }
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey.shade900,
    primaryColor: Colors.black87,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        backgroundColor: Colors.black,
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark()
        .copyWith(secondary: Colors.grey.shade900)
        .copyWith(background: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white70,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightThemeWhiteBackground,
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryIconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        backgroundColor: Colors.white,
        color: Colors.black,
      ),
    ),
    colorScheme: const ColorScheme.light()
        .copyWith(secondary: lightThemeWhiteBackground)
        .copyWith(background: Colors.white),
  );
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (_) => ThemeNotifier(),
);
