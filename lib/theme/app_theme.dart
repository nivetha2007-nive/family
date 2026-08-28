import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Main theme configuration for the anniversary app
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryBurgundy,
      scaffoldBackgroundColor: AppColors.creamBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryBurgundy,
        secondary: AppColors.gold,
        surface: AppColors.lightCream,
        error: AppColors.deepRed,
        onPrimary: AppColors.whiteText,
        onSecondary: AppColors.darkText,
        onSurface: AppColors.darkText,
      ),
      
      // App bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.creamBackground,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTextStyles.heading2,
      ),
      
      // Text theme
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineLarge: AppTextStyles.heading1,
        headlineMedium: AppTextStyles.heading2,
        headlineSmall: AppTextStyles.heading3,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.label,
        labelMedium: AppTextStyles.caption,
      ),
      
      // Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBurgundy,
          foregroundColor: AppColors.whiteText,
          elevation: 4,
          shadowColor: AppColors.softShadow,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
      
      // Card theme
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 8,
        shadowColor: AppColors.softShadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(12),
      ),
      
      // Icon theme
      iconTheme: const IconThemeData(
        color: AppColors.primaryBurgundy,
        size: 24,
      ),
      
      // Divider theme
      dividerTheme: const DividerThemeData(
        color: AppColors.lightText,
        thickness: 1,
        space: 32,
      ),
      
      useMaterial3: true,
    );
  }
  
  // Common decoration styles
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: AppColors.softShadow,
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ],
  );
  
  static BoxDecoration get elegantCardDecoration => BoxDecoration(
    color: AppColors.lightCream,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: AppColors.gold.withOpacity(0.3),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.softShadow,
        blurRadius: 15,
        offset: const Offset(0, 8),
      ),
    ],
  );
  
  static BoxDecoration get gradientDecoration => BoxDecoration(
    gradient: AppColors.primaryGradient,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: AppColors.primaryBurgundy.withOpacity(0.3),
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ],
  );
}
