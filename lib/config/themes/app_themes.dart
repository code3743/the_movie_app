import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_fonts.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: AppFonts.heading1,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: AppFonts.heading2,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: AppFonts.heading2,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: AppFonts.bodyText,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondary,
        ),
        bodySmall: TextStyle(
          fontSize: AppFonts.caption,
          color: AppColors.textSecondary,
        ),
        labelLarge: TextStyle(
          fontSize: AppFonts.bodyText,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
        buttonColor: AppColors.primary,
        height: AppSizes.buttonHeight,
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.secondary,
        elevation: 0,
        toolbarHeight: AppSizes.appBarHeight,
        titleTextStyle: TextStyle(
          fontSize: AppFonts.heading2,
          fontWeight: FontWeight.bold,
          color: AppColors.accent,
        ),
        iconTheme: IconThemeData(
          size: AppSizes.iconSize,
          color: AppColors.accent,
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColors.accent,
        size: AppSizes.iconSize,
      ),
    );
  }
}
