import 'package:flutter/material.dart';
import 'dart:async';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../constants/app_constants.dart';
import '../constants/animation_config.dart';
import '../widgets/decorative_divider.dart';
import '../widgets/memory_app_wrapper.dart';
import 'final_message_screen.dart';

/// 20th Anniversary celebration screen
/// Features celebratory animations, floating hearts, and emotional messages
class CelebrationScreen extends StatefulWidget {
  const CelebrationScreen({super.key});

  @override
  State<CelebrationScreen> createState() => _CelebrationScreenState();
}

class _CelebrationScreenState extends State<CelebrationScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _pulseController;
  
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _numberAnimation;
  late Animation<double> _pulseAnimation;
  
  bool _showContinueButton = false;

  @override
  void initState() {
    super.initState();
    
    // Main animation controller
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    
    // Pulse animation for the number
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    
    // Fade in animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    ));
    
    // Scale animation for the "20"
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.2, 0.7, curve: Curves.elasticOut),
    ));
    
    // Number counting animation
    _numberAnimation = Tween<double>(
      begin: 0.0,
      end: 20.0,
    ).animate(CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
    ));
    
    // Pulse animation
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.08,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
    
    // Start animations
    _mainController.forward();
    
    // Show continue button after animations
    Timer(const Duration(milliseconds: 3500), () {
      if (mounted) {
        setState(() {
          _showContinueButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _navigateToFinalMessage() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const FinalMessageScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: MemoryAppWrapper(
        intensity: AnimationIntensity.enhanced,
        quotePosition: QuotePosition.bottomCenter,
        child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryBurgundy.withOpacity(0.1),
              AppColors.creamBackground,
              AppColors.lightCream,
              AppColors.gold.withOpacity(0.1),
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Close button
              Positioned(
                top: 16,
                left: 16,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.95),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.softShadow,
                            blurRadius: 12,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryBurgundy,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ),
              
              // Main content
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.screenPaddingHorizontal,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      
                      // Animated "20"
                      AnimatedBuilder(
                        animation: _mainController,
                        builder: (context, child) {
                          return ScaleTransition(
                            scale: _scaleAnimation,
                            child: FadeTransition(
                              opacity: _fadeAnimation,
                              child: ScaleTransition(
                                scale: _pulseAnimation,
                                child: Text(
                                  _numberAnimation.value.toInt().toString(),
                                  style: AppTypography.mainTitle.copyWith(
                                    fontSize: size.width < 360 ? 100 : 120,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryBurgundy,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // "Years of Love"
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          'Years of Love',
                          style: AppTypography.sectionTitle.copyWith(
                            fontSize: size.width < 360 ? 32 : 38,
                            color: AppColors.darkText,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Heart icon
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: ScaleTransition(
                          scale: _pulseAnimation,
                          child: const Icon(
                            Icons.favorite,
                            size: 50,
                            color: AppColors.deepRed,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Decorative divider
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: const DecorativeDivider(
                          width: 250,
                          color: AppColors.gold,
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Celebration message
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: AppColors.gold.withOpacity(0.3),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.softShadow,
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Happy Anniversary',
                                style: AppTypography.timelineTitle.copyWith(
                                  color: AppColors.primaryBurgundy,
                                  fontSize: size.width < 360 ? 24 : 28,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              const SizedBox(height: 20),
                              
                              Text(
                                'Amma & Daddy',
                                style: AppTypography.coupleNames.copyWith(
                                  fontSize: size.width < 360 ? 18 : 22,
                                  color: AppColors.deepRed,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              const SizedBox(height: 24),
                              
                              const DecorativeDivider(
                                width: 150,
                                color: AppColors.gold,
                              ),
                              
                              const SizedBox(height: 24),
                              
                              Text(
                                '20 years.',
                                style: AppTypography.bodyMedium.copyWith(
                                  fontSize: size.width < 360 ? 16 : 18,
                                  height: 1.8,
                                  color: AppColors.darkText,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              Text(
                                'Thousands of memories.',
                                style: AppTypography.bodyMedium.copyWith(
                                  fontSize: size.width < 360 ? 16 : 18,
                                  height: 1.8,
                                  color: AppColors.darkText,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              Text(
                                'One beautiful journey.',
                                style: AppTypography.bodyMedium.copyWith(
                                  fontSize: size.width < 360 ? 16 : 18,
                                  height: 1.8,
                                  color: AppColors.darkText,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              const SizedBox(height: 24),
                              
                              // Anniversary photo
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.gold,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.gold.withOpacity(0.3),
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: Image.asset(
                                      'images/parents/celebration_photo.jpg',
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        // Fallback if photo not found
                                        return Container(
                                          color: AppColors.warmBeige,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add_photo_alternate_outlined,
                                                  size: 48,
                                                  color: AppColors.mediumText.withOpacity(0.5),
                                                ),
                                                const SizedBox(height: 12),
                                                Text(
                                                  'Add celebration_photo.jpg to\nassets/images/parents/',
                                                  style: AppTypography.caption.copyWith(
                                                    color: AppColors.mediumText,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 48),
                      
                      // Continue button
                      AnimatedOpacity(
                        opacity: _showContinueButton ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 600),
                        child: ElevatedButton(
                          onPressed: _navigateToFinalMessage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.gold,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 8,
                            shadowColor: AppColors.gold.withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'One More Message',
                                style: AppTypography.button.copyWith(
                                  color: AppColors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        ),
    );
  }
}
