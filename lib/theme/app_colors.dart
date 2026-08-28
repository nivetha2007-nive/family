import 'package:flutter/material.dart';

/// App color palette inspired by elegant anniversary design
/// Based on burgundy, cream, and gold color scheme
class AppColors {
  // Primary colors
  static const Color primaryBurgundy = Color(0xFF8B1E3F);
  static const Color deepRed = Color(0xFFC41E3A);
  static const Color lightRed = Color(0xFFE63946);
  
  // Background colors
  static const Color creamBackground = Color(0xFFF5EBE0);
  static const Color lightCream = Color(0xFFFFF5E4);
  static const Color warmBeige = Color(0xFFF4E8D8);
  
  // Accent colors
  static const Color gold = Color(0xFFD4AF37);
  static const Color darkGold = Color(0xFFB8860B);
  static const Color lightGold = Color(0xFFFFF8DC);
  
  // Text colors
  static const Color darkText = Color(0xFF2D2D2D);
  static const Color mediumText = Color(0xFF5A5A5A);
  static const Color lightText = Color(0xFF8E8E8E);
  static const Color whiteText = Color(0xFFFFFEFB);
  
  // Additional colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color softShadow = Color(0x1A000000);
  
  // Gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryBurgundy, deepRed],
  );
  
  static const LinearGradient creamGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [lightCream, creamBackground],
  );
  
  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gold, darkGold],
  );
}
