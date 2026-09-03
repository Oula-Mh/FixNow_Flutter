import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF006065);

  static const String fontFamilyPlusJakarta = 'PlusJakartaSans';
  static const String fontFamilyInter = 'Inter';

  static const TextStyle titleBold24 = TextStyle(
    fontFamily: fontFamilyPlusJakarta,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    letterSpacing: 0,
  );

  static const TextStyle bodyRegular16 = TextStyle(
    fontFamily: fontFamilyInter,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: 0,
  );

  static const TextStyle titleSemiBold24 = TextStyle(
    fontFamily: fontFamilyPlusJakarta,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    letterSpacing: 0,
  );

  // ------------------ Light Theme ------------------
  static ThemeData ligthTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFFF9F9F8)),
    scaffoldBackgroundColor: Color(0xFFF9F9F8),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      brightness: Brightness.light,
      surface: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
      shape: CircleBorder(),
    ),
filledButtonTheme: FilledButtonThemeData(
  style: FilledButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ),
),
    textTheme: TextTheme(
      headlineLarge: titleBold24.copyWith(color: Colors.black),

      headlineMedium: titleSemiBold24.copyWith(color: Colors.black),

      bodyLarge: bodyRegular16.copyWith(color: const Color(0xFF3E4949)),
    ),
  );

  // ------------------ Dark Theme ------------------
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121819),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: titleBold24.copyWith(color: Colors.white),

      headlineMedium: titleSemiBold24.copyWith(color: Colors.white),

      bodyLarge: bodyRegular16.copyWith(color: const Color(0xFFE2E8F0)),
    ),
  );
}
