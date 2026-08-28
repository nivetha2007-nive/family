import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Centralized Typography System for Anniversary App
/// Using Dekko font throughout the application for a warm, handwritten feel
class AppTypography {
  // Font family constant
  static const String primaryFont = 'Dekko';
  
  // ==========================================================================
  // LARGE DISPLAY TEXTS (Hero sections, major titles)
  // ==========================================================================
  
  /// Main title - "20 Years of Love"
  static const TextStyle mainTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.5,
    color: AppColors.primaryBurgundy,
  );
  
  /// Section titles - Page headers
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.3,
    color: AppColors.darkText,
  );
  
  // ==========================================================================
  // COUPLE NAMES
  // ==========================================================================
  
  /// Couple names display - "Sriram D & Shabina M"
  static const TextStyle coupleNames = TextStyle(
    fontFamily: primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
    color: AppColors.deepRed,
  );
  
  /// Couple names smaller version
  static const TextStyle coupleNamesSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.4,
    color: AppColors.deepRed,
  );
  
  // ==========================================================================
  // TIMELINE SPECIFIC
  // ==========================================================================
  
  /// Timeline year badge
  static const TextStyle timelineYear = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.5,
    color: AppColors.whiteText,
  );
  
  /// Timeline card title
  static const TextStyle timelineTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.3,
    color: AppColors.primaryBurgundy,
  );
  
  /// Timeline description text
  static const TextStyle timelineDescription = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.7,
    letterSpacing: 0.2,
    color: AppColors.darkText,
  );
  
  // ==========================================================================
  // BODY TEXT
  // ==========================================================================
  
  /// Main body text - paragraphs, descriptions
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.8,
    letterSpacing: 0.2,
    color: AppColors.darkText,
  );
  
  /// Medium body text
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.7,
    letterSpacing: 0.2,
    color: AppColors.darkText,
  );
  
  /// Small body text
  static const TextStyle bodySmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 0.2,
    color: AppColors.mediumText,
  );
  
  // ==========================================================================
  // DATES
  // ==========================================================================
  
  /// Date display - "03 • 09 • 2006"
  static const TextStyle dateText = TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 1.5,
    color: AppColors.primaryBurgundy,
  );
  
  /// Small date text
  static const TextStyle dateSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 1.0,
    color: AppColors.mediumText,
  );
  
  // ==========================================================================
  // CAPTIONS & LABELS
  // ==========================================================================
  
  /// Caption text - image captions, helper text
  static const TextStyle caption = TextStyle(
    fontFamily: primaryFont,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.2,
    color: AppColors.lightText,
  );
  
  /// Label text - buttons, tags
  static const TextStyle label = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.5,
    color: AppColors.mediumText,
  );
  
  // ==========================================================================
  // BUTTONS
  // ==========================================================================
  
  /// Primary button text
  static const TextStyle button = TextStyle(
    fontFamily: primaryFont,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0.8,
    color: AppColors.whiteText,
  );
  
  /// Large button text
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 19,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 1.0,
    color: AppColors.whiteText,
  );
  
  /// Small button/link text
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColors.whiteText,
  );
  
  // ==========================================================================
  // LETTER (Personal message screen)
  // ==========================================================================
  
  /// Letter title
  static const TextStyle letterTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 26,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.3,
    color: AppColors.primaryBurgundy,
  );
  
  /// Letter body text - needs to be very readable
  static const TextStyle letterBody = TextStyle(
    fontFamily: primaryFont,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.9,
    letterSpacing: 0.2,
    color: AppColors.darkText,
  );
  
  /// Letter signature
  static const TextStyle letterSignature = TextStyle(
    fontFamily: primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.3,
    color: AppColors.primaryBurgundy,
  );
  
  // ==========================================================================
  // QUOTES (Love quote popups)
  // ==========================================================================
  
  /// Quote text in popups
  static const TextStyle quote = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.8,
    letterSpacing: 0.2,
    color: AppColors.darkText,
  );
  
  /// Quote attribution
  static const TextStyle quoteAttribution = TextStyle(
    fontFamily: primaryFont,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.3,
    color: AppColors.mediumText,
  );
  
  // ==========================================================================
  // SPECIAL TEXTS
  // ==========================================================================
  
  /// "Coming Soon" placeholder text
  static const TextStyle comingSoon = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.3,
    color: AppColors.mediumText,
  );
  
  /// Navigation text
  static const TextStyle navigation = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.2,
    color: AppColors.darkText,
  );
  
  /// App bar title
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0.3,
    color: AppColors.darkText,
  );
  
  /// Card title
  static const TextStyle cardTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 19,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.2,
    color: AppColors.primaryBurgundy,
  );
  
  /// Card subtitle
  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.2,
    color: AppColors.mediumText,
  );
}
