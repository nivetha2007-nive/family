import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography system for the anniversary app
/// Elegant serif fonts for headings, clean sans-serif for body text
class AppTextStyles {
  // Display styles (Large headings)
  static const TextStyle displayLarge = TextStyle(
    fontFamily: 'Serif',
    fontSize: 48,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColors.darkText,
  );
  
  static const TextStyle displayMedium = TextStyle(
    fontFamily: 'Serif',
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.5,
    color: AppColors.darkText,
  );
  
  static const TextStyle displaySmall = TextStyle(
    fontFamily: 'Serif',
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.5,
    color: AppColors.darkText,
  );
  
  // Heading styles
  static const TextStyle heading1 = TextStyle(
    fontFamily: 'Serif',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0.3,
    color: AppColors.darkText,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontFamily: 'Serif',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.3,
    color: AppColors.darkText,
  );
  
  static const TextStyle heading3 = TextStyle(
    fontFamily: 'Serif',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.2,
    color: AppColors.darkText,
  );
  
  // Elegant script-style text
  static const TextStyle elegant = TextStyle(
    fontFamily: 'Serif',
    fontSize: 42,
    fontWeight: FontWeight.w300,
    height: 1.2,
    letterSpacing: 1.0,
    fontStyle: FontStyle.italic,
    color: AppColors.primaryBurgundy,
  );
  
  static const TextStyle elegantMedium = TextStyle(
    fontFamily: 'Serif',
    fontSize: 28,
    fontWeight: FontWeight.w300,
    height: 1.3,
    letterSpacing: 0.8,
    fontStyle: FontStyle.italic,
    color: AppColors.primaryBurgundy,
  );
  
  // Body text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'SansSerif',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 0.3,
    color: AppColors.darkText,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'SansSerif',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 0.3,
    color: AppColors.darkText,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'SansSerif',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.2,
    color: AppColors.mediumText,
  );
  
  // Caption and labels
  static const TextStyle caption = TextStyle(
    fontFamily: 'SansSerif',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.3,
    color: AppColors.lightText,
  );
  
  static const TextStyle label = TextStyle(
    fontFamily: 'SansSerif',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.5,
    color: AppColors.mediumText,
  );
  
  // Button text
  static const TextStyle button = TextStyle(
    fontFamily: 'SansSerif',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 1.0,
    color: AppColors.whiteText,
  );
  
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: 'SansSerif',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 1.2,
    color: AppColors.whiteText,
  );
  
  // Special date text
  static const TextStyle dateText = TextStyle(
    fontFamily: 'SansSerif',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 2.0,
    color: AppColors.primaryBurgundy,
  );
  
  // Quote text
  static const TextStyle quote = TextStyle(
    fontFamily: 'Serif',
    fontSize: 18,
    fontWeight: FontWeight.w300,
    height: 1.7,
    letterSpacing: 0.5,
    fontStyle: FontStyle.italic,
    color: AppColors.mediumText,
  );
  
  // "weds" connector text
  static const TextStyle connector = TextStyle(
    fontFamily: 'Serif',
    fontSize: 16,
    fontWeight: FontWeight.w300,
    height: 1.5,
    letterSpacing: 2.0,
    color: AppColors.mediumText,
  );
}
