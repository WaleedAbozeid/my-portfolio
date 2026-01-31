import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const String englishFont = 'Inter';
  static const String arabicFont = 'Cairo';

  static TextTheme getTextTheme(bool isDark, String languageCode) {
    // Determine the base text theme
    final baseTextTheme = isDark
        ? ThemeData.dark().textTheme
        : ThemeData.light().textTheme;

    // Choose font based on language
    final textTheme = languageCode == 'ar'
        ? GoogleFonts.cairoTextTheme(baseTextTheme)
        : GoogleFonts.interTextTheme(baseTextTheme);

    return textTheme;
  }
}
