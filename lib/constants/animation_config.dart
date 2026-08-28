import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Centralized animation configuration
/// Change these values to adjust the entire app's animation behavior
class AnimationConfig {
  // Heart animation settings
  static const int heartCount = 25; // Increased count
  static const double minHeartSize = 16.0; // Increased size
  static const double maxHeartSize = 32.0; // Increased size
  static const double minHeartOpacity = 0.2; // Increased visibility
  static const double maxHeartOpacity = 0.6; // Increased visibility
  static const Duration minHeartDuration = Duration(seconds: 8);
  static const Duration maxHeartDuration = Duration(seconds: 15);
  
  // Particle animation settings
  static const int particleCount = 20; // Increased count
  static const double minParticleSize = 4.0; // Increased size
  static const double maxParticleSize = 8.0; // Increased size
  static const double minParticleOpacity = 0.1; // Increased visibility
  static const double maxParticleOpacity = 0.35; // Increased visibility
  
  // Quote system settings
  static const Duration quoteCycleDuration = Duration(seconds: 20); // Changed to 20 seconds
  static const Duration quoteDisplayDuration = Duration(seconds: 5);
  static const Duration quoteFadeInDuration = Duration(milliseconds: 800);
  static const Duration quoteFadeOutDuration = Duration(milliseconds: 600);
  
  // Screen-specific intensity levels (0.0 to 1.0)
  static const Map<AnimationIntensity, double> intensityLevels = {
    AnimationIntensity.minimal: 0.2,
    AnimationIntensity.subtle: 0.4,
    AnimationIntensity.moderate: 0.6,
    AnimationIntensity.normal: 0.8,
    AnimationIntensity.enhanced: 1.0,
  };
  
  // Colors
  static const Color heartColor = AppColors.deepRed;
  static const Color particleColor = AppColors.gold;
  static const Color quoteBackgroundColor = AppColors.lightCream;
  static const Color quoteTextColor = AppColors.darkText;
  
  // Performance settings
  static const bool pauseWhenInBackground = true;
  static const int maxActiveAnimations = 35;
}

/// Animation intensity levels for different screens
enum AnimationIntensity {
  minimal,    // Very subtle - for letter, video player
  subtle,     // Gentle - for photo gallery, story
  moderate,   // Balanced - for most screens
  normal,     // Standard - for home, navigation
  enhanced,   // Magical - for celebration, final message
}
