import 'package:flutter/material.dart';

class AppThemeData {
  /// light theme
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primaryColor: const Color(0xFF8B0C69),
        colorScheme: const ColorScheme.light(
          surface: Color(0xFFF1F1F1),
          surfaceVariant: Color(0xFFFAFAFA),
          onSurface: Color(0xb3000000),
          background: Color(0xFFFFFFFF),
          onBackground: Color(0xFF000000),
        ),
      );

  /// dark theme
  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: const Color(0xFF8B0C69),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8B0C69),
        ),
      );
}
