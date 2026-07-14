import 'package:flutter/material.dart';

/// Custom light and dark themes for the app. No Flutter default
/// ThemeData is used directly — every color lives in a ColorScheme
/// so widgets can read it via Theme.of(context) instead of
/// hardcoding colors.
class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF4F6F8),
    cardColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF3F51B5),
      onPrimary: Colors.white,
      secondary: Color(0xFF00897B),
      onSecondary: Colors.white,
      tertiary: Color(0xFFFF8F00),
      onTertiary: Colors.white,
      primaryContainer: Color(0xFFC5CAE9),
      surface: Colors.white,
      onSurface: Color(0xFF1B1B1B),
      error: Color(0xFFB00020),
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF3F51B5),
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF3F51B5),
      unselectedItemColor: Color(0xFF9E9E9E),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF1B1B1B),
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        color: Color(0xFF1B1B1B),
      ),
      bodyLarge: TextStyle(color: Color(0xFF3A3A3A)),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF3F51B5), width: 2),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardColor: const Color(0xFF1E1E1E),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF9FA8DA),
      onPrimary: Color(0xFF1B1B1B),
      secondary: Color(0xFF4DB6AC),
      onSecondary: Color(0xFF1B1B1B),
      tertiary: Color(0xFFFFB74D),
      onTertiary: Color(0xFF1B1B1B),
      primaryContainer: Color(0xFF303F9F),
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
      error: Color(0xFFCF6679),
      onError: Color(0xFF1B1B1B),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1F1F1F),
      selectedItemColor: Color(0xFF9FA8DA),
      unselectedItemColor: Color(0xFF757575),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(color: Color(0xFFD0D0D0)),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF9FA8DA), width: 2),
      ),
    ),
  );
}
