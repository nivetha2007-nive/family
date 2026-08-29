import 'package:flutter/material.dart';
import 'dart:async';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../constants/app_constants.dart';
import '../constants/animation_config.dart';
import '../widgets/decorative_divider.dart';
import '../widgets/memory_app_wrapper.dart';
import 'video_invitation_screen.dart';

/// Opening screen - First impression of the anniversary app
/// "20 Years of Love ❤️" with elegant animations
/// Navigates directly to Canva video (NO Flutter invitation page)
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    
    // Fade in animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));
    
    // Scale animation
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
    ));
    
    // Slide up animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
    ));
    
    // Start animations
    _controller.forward();
    
    // Show button after animations complete
    Timer(const Duration(milliseconds: 2200), () {
      if (mounted) {
        setState(() {
          _showButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToInvitation() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const VideoInvitationScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: MemoryAppWrapper(
        intensity: AnimationIntensity.enhanced,
        quotePosition: QuotePosition.center,
        child: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.creamBackground,
              AppColors.lightCream,
              AppColors.warmBeige,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Decorative background elements
              Positioned(
                top: -50,
                right: -50,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.deepRed.withOpacity(0.1),
                          AppColors.deepRed.withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
              Positioned(
                bottom: -80,
                left: -80,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.gold.withOpacity(0.15),
                          AppColors.gold.withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    
                    // Main title with animations
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Column(
                          children: [
                            // Anniversary years
                            Text(
                              '${AppConstants.anniversaryYears}',
                              style: AppTextStyles.displayLarge.copyWith(
                                fontSize: 80,
                                fontWeight: FontWeight.w300,
                                color: AppColors.primaryBurgundy,
                              ),
                            ),
                            
                            const SizedBox(height: 8),
                            
                            // "Years of Love"
                            Text(
                              'Years of Love',
                              style: AppTextStyles.elegant.copyWith(
                                fontSize: 36,
                                color: AppColors.darkText,
                              ),
                            ),
                            
                            const SizedBox(height: 24),
                            
                            // Heart icon
                            const Icon(
                              Icons.favorite,
                              size: 40,
                              color: AppColors.deepRed,
                            ),
                          ],
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
                    
                    // Subtitle with slide animation
                    SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              Text(
                                'Celebrating',
                                style: AppTextStyles.bodyLarge.copyWith(
                                  color: AppColors.mediumText,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Mom & Dad',
                                style: AppTextStyles.heading1.copyWith(
                                  color: AppColors.primaryBurgundy,
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    const Spacer(flex: 2),
                    
                    // Begin Our Story button
                    AnimatedOpacity(
                      opacity: _showButton ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 600),
                      child: AnimatedSlide(
                        offset: _showButton ? Offset.zero : const Offset(0, 0.5),
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: ElevatedButton(
                            onPressed: _navigateToInvitation,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBurgundy,
                              foregroundColor: AppColors.whiteText,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 48,
                                vertical: 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 8,
                              shadowColor: AppColors.primaryBurgundy.withOpacity(0.4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Begin Our Story',
                                  style: AppTextStyles.buttonLarge.copyWith(
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 60),
                  ],
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
