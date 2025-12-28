import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.outfit(fontSize: 57, fontWeight: FontWeight.w400),
    displayMedium: GoogleFonts.outfit(
      fontSize: 45,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: GoogleFonts.outfit(fontSize: 36, fontWeight: FontWeight.w400),
    headlineLarge: GoogleFonts.outfit(
      fontSize: 32,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: GoogleFonts.outfit(
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: GoogleFonts.outfit(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w500),
    titleSmall: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w500),
    labelLarge: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w400),
  );

  static ThemeData get lightTheme {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return _iosLightTheme;
    }
    return _androidLightTheme;
  }

  static ThemeData get darkTheme {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return _iosDarkTheme;
    }
    return _androidDarkTheme;
  }

  // Android Light Theme (Material 3 Standard)
  static ThemeData get _androidLightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4), // StudyNest primary color
        brightness: Brightness.light,
      ),
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // iOS Light Theme (Cupertino-inspired Material)
  static ThemeData get _iosLightTheme {
    return ThemeData(
      useMaterial3: true,
      // Use a slightly different seed or customizations for iOS feel if desired
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF007AFF), // System Blue for iOS feel
        brightness: Brightness.light,
      ),
      textTheme: textTheme,
      // iOS specific button styling - minimal rounding?
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ), // Less rounded
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
      ),
      // Add CupertinoOverrideTheme if needed for specific widgets
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: Color(0xFF007AFF),
      ),
    );
  }

  // Android Dark Theme
  static ThemeData get _androidDarkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFD0BCFF),
        brightness: Brightness.dark,
      ),
      textTheme: textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
      ),
    );
  }

  // iOS Dark Theme
  static ThemeData get _iosDarkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0A84FF), // iOS Dark Mode Blue
        brightness: Brightness.dark,
      ),
      textTheme: textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: Color(0xFF0A84FF),
      ),
    );
  }
}
