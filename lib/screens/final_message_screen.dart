import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../constants/animation_config.dart';
import '../widgets/decorative_divider.dart';
import '../widgets/memory_app_wrapper.dart';

/// Final message screen - Closing words for the anniversary app
class FinalMessageScreen extends StatefulWidget {
  const FinalMessageScreen({super.key});

  @override
  State<FinalMessageScreen> createState() => _FinalMessageScreenState();
}

class _FinalMessageScreenState extends State<FinalMessageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Placeholder final message - User will replace with actual message
  final String _finalMessage = '''Thank you for showing me what love, patience, friendship, and family truly mean.

Thank you for being my first teachers, my biggest supporters, and my constant source of strength.

Thank you for creating a home filled with warmth, laughter, and unconditional love.

Thank you for showing me that true love isn't just about the grand gestures – it's about showing up every single day, choosing each other again and again.

You've built something beautiful together. Not just a marriage, but a partnership, a friendship, and a love story that inspires everyone around you.

May your love continue to grow stronger with each passing year.

Here's to many more years of happiness, health, and togetherness.

''';

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
    ));
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MemoryAppWrapper(
      intensity: AnimationIntensity.normal,
      quotePosition: QuotePosition.center,
      child: Scaffold(
      backgroundColor: AppColors.creamBackground,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightCream,
              AppColors.creamBackground,
              AppColors.warmBeige.withOpacity(0.5),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Close button
              Positioned(
                top: 16,
                left: 16,
                child: IconButton(
                  onPressed: () {
                    // Navigate back to home
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.softShadow,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.home,
                      color: AppColors.primaryBurgundy,
                      size: 24,
                    ),
                  ),
                ),
              ),
              
              // Main content
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 60,
                  ),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Heart icon
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryBurgundy.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.favorite,
                              size: 40,
                              color: AppColors.whiteText,
                            ),
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Title
                          Text(
                            'With All Our Love',
                            style: AppTextStyles.heading1.copyWith(
                              color: AppColors.primaryBurgundy,
                              fontSize: 32,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          
                          const SizedBox(height: 24),
                          
                          const DecorativeDivider(
                            width: 200,
                            color: AppColors.gold,
                          ),
                          
                          const SizedBox(height: 40),
                          
                          // Message card
                          Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: AppColors.white,
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
                                // Decorative icon
                                Icon(
                                  Icons.format_quote,
                                  size: 40,
                                  color: AppColors.gold.withOpacity(0.5),
                                ),
                                
                                const SizedBox(height: 24),
                                
                                // Final message
                                SelectableText(
                                  _finalMessage,
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    height: 1.9,
                                    color: AppColors.darkText,
                                    fontSize: 16,
                                    letterSpacing: 0.3,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                
                                const SizedBox(height: 32),
                                
                                const DecorativeDivider(
                                  width: 120,
                                  color: AppColors.gold,
                                ),
                                
                                const SizedBox(height: 24),
                                
                                // Hearts
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    3,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 20,
                                        color: AppColors.deepRed.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 48),
                          
                          // Closing note
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBurgundy.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              '❤️ அம்மா & அப்பாவிற்கு அன்புடன் உருவாக்கப்பட்டது ❤️',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.primaryBurgundy,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Home button
                          OutlinedButton.icon(
                            onPressed: () {
                              Navigator.of(context).popUntil((route) => route.isFirst);
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primaryBurgundy,
                              side: const BorderSide(
                                color: AppColors.primaryBurgundy,
                                width: 2,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            icon: const Icon(Icons.home, size: 22),
                            label: Text(
                              'Back to Home',
                              style: AppTextStyles.button.copyWith(
                                color: AppColors.primaryBurgundy,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
