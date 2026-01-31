import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class AppTheme {
  static ThemeData getTheme({
    required bool isDark,
    required String languageCode,
  }) {
    final textTheme = AppTextStyles.getTextTheme(isDark, languageCode);

    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: isDark
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      colorScheme: isDark ? _darkColorScheme : _lightColorScheme,
      textTheme: textTheme.apply(
        bodyColor: isDark
            ? AppColors.darkTextPrimary
            : AppColors.lightTextPrimary,
        displayColor: isDark
            ? AppColors.darkTextPrimary
            : AppColors.lightTextPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark
            ? AppColors.darkBackground
            : AppColors.lightBackground,
        foregroundColor: isDark
            ? AppColors.darkTextPrimary
            : AppColors.lightTextPrimary,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: isDark
            ? AppColors.darkSecondaryBackground
            : AppColors.lightSecondaryBackground,
        elevation: isDark ? 0 : 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      iconTheme: IconThemeData(
        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
      ),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.primary,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: AppColors.lightSecondaryBackground,
    onSurface: AppColors.lightTextPrimary,
    background: AppColors.lightBackground,
    onBackground: AppColors.lightTextPrimary,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.primary,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: AppColors.darkSecondaryBackground,
    onSurface: AppColors.darkTextPrimary,
    background: AppColors.darkBackground,
    onBackground: AppColors.darkTextPrimary,
  );
}
