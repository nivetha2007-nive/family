import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../constants/app_constants.dart';
import '../constants/animation_config.dart';
import '../widgets/decorative_divider.dart';
import '../widgets/memory_app_wrapper.dart';
import 'home_screen.dart';

/// Wedding invitation style screen showing where their story began
/// Sriram D weds Shabina M - 03•09•2006
class InvitationScreen extends StatefulWidget {
  const InvitationScreen({super.key});

  @override
  State<InvitationScreen> createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _particlesController;
  
  // Individual element animations
  late Animation<double> _backgroundFade;
  late Animation<double> _taglineFade;
  late Animation<double> _groomNameFade;
  late Animation<double> _wedsTextFade;
  late Animation<double> _brideNameFade;
  late Animation<double> _dateFade;
  late Animation<double> _venueFade;
  late Animation<double> _childrenFade;
  late Animation<double> _buttonFade;
  
  late Animation<Offset> _groomSlide;
  late Animation<Offset> _brideSlide;

  @override
  void initState() {
    super.initState();
    
    // Main animation controller
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );
    
    // Particles animation controller
    _particlesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    
    // Staggered animations for each element
    _backgroundFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.2, curve: Curves.easeIn),
      ),
    );
    
    _taglineFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.1, 0.3, curve: Curves.easeOut),
      ),
    );
    
    _groomNameFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.25, 0.45, curve: Curves.easeOut),
      ),
    );
    
    _groomSlide = Tween<Offset>(
      begin: const Offset(-0.3, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.25, 0.45, curve: Curves.easeOut),
      ),
    );
    
    _wedsTextFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.4, 0.5, curve: Curves.easeOut),
      ),
    );
    
    _brideNameFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.45, 0.65, curve: Curves.easeOut),
      ),
    );
    
    _brideSlide = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.45, 0.65, curve: Curves.easeOut),
      ),
    );
    
    _dateFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.6, 0.75, curve: Curves.easeOut),
      ),
    );
    
    _venueFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.7, 0.85, curve: Curves.easeOut),
      ),
    );
    
    _childrenFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.8, 0.95, curve: Curves.easeOut),
      ),
    );
    
    _buttonFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.85, 1.0, curve: Curves.easeOut),
      ),
    );
    
    // Start animations
    _mainController.forward();
  }

  @override
  void dispose() {
    _mainController.dispose();
    _particlesController.dispose();
    super.dispose();
  }

  void _continueStory() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
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
        intensity: AnimationIntensity.normal,
        quotePosition: QuotePosition.bottomCenter,
        child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightCream,
              AppColors.creamBackground,
              AppColors.warmBeige.withOpacity(0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Animated decorative particles
              AnimatedBuilder(
                animation: _particlesController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _DecorativeParticlesPainter(
                      progress: _particlesController.value,
                    ),
                    child: Container(),
                  );
                },
              ),
              
              // Main content
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  constraints: BoxConstraints(minHeight: size.height),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.screenPaddingHorizontal,
                    vertical: AppConstants.screenPaddingVertical,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      
                      // Decorative top border
                      FadeTransition(
                        opacity: _backgroundFade,
                        child: _buildDecorativeFrame(),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // "The day their forever began..."
                      FadeTransition(
                        opacity: _taglineFade,
                        child: Text(
                          'The day their forever began...',
                          style: AppTextStyles.quote.copyWith(
                            fontSize: 16,
                            color: AppColors.mediumText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Groom's name
                      SlideTransition(
                        position: _groomSlide,
                        child: FadeTransition(
                          opacity: _groomNameFade,
                          child: Text(
                            AppConstants.groomName,
                            style: AppTextStyles.elegant.copyWith(
                              fontSize: 44,
                              color: AppColors.primaryBurgundy,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // "weds" with decorative elements
                      FadeTransition(
                        opacity: _wedsTextFade,
                        child: Column(
                          children: [
                            const OrnamentalDivider(
                              color: AppColors.gold,
                              thickness: 1,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'weds',
                              style: AppTextStyles.connector.copyWith(
                                fontSize: 18,
                                color: AppColors.mediumText,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const OrnamentalDivider(
                              color: AppColors.gold,
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Bride's name
                      SlideTransition(
                        position: _brideSlide,
                        child: FadeTransition(
                          opacity: _brideNameFade,
                          child: Text(
                            AppConstants.brideName,
                            style: AppTextStyles.elegant.copyWith(
                              fontSize: 44,
                              color: AppColors.primaryBurgundy,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 48),
                      
                      // Wedding date
                      FadeTransition(
                        opacity: _dateFade,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.gold.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            AppConstants.weddingDate,
                            style: AppTextStyles.dateText.copyWith(
                              fontSize: 26,
                              letterSpacing: 3.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Venue
                      FadeTransition(
                        opacity: _venueFade,
                        child: Column(
                          children: [
                            const Icon(
                              Icons.place_outlined,
                              size: 24,
                              color: AppColors.gold,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              AppConstants.weddingVenue,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.mediumText,
                                letterSpacing: 1.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 56),
                      
                      // Decorative divider
                      FadeTransition(
                        opacity: _childrenFade,
                        child: const DecorativeDivider(
                          width: 200,
                          color: AppColors.deepRed,
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Children's dedication
                      FadeTransition(
                        opacity: _childrenFade,
                        child: Column(
                          children: [
                            Text(
                              'With Love,',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.mediumText,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your Affectionate Children',
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.darkText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppConstants.child1Name,
                                  style: AppTextStyles.heading3.copyWith(
                                    color: AppColors.primaryBurgundy,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  ' & ',
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: AppColors.mediumText,
                                  ),
                                ),
                                Text(
                                  AppConstants.child2Name,
                                  style: AppTextStyles.heading3.copyWith(
                                    color: AppColors.primaryBurgundy,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Icon(
                              Icons.favorite,
                              size: 24,
                              color: AppColors.deepRed,
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 56),
                      
                      // Continue button
                      FadeTransition(
                        opacity: _buttonFade,
                        child: ElevatedButton(
                          onPressed: _continueStory,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBurgundy,
                            foregroundColor: AppColors.whiteText,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 6,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Continue Their Story',
                                style: AppTextStyles.button.copyWith(
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 40),
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
  
  Widget _buildDecorativeFrame() {
    return Column(
      children: [
        // Top corner decorations
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCornerDecoration(),
            _buildCornerDecoration(flip: true),
          ],
        ),
      ],
    );
  }
  
  Widget _buildCornerDecoration({bool flip = false}) {
    return Transform(
      transform: Matrix4.identity()..scale(flip ? -1.0 : 1.0, 1.0),
      alignment: Alignment.center,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.gold.withOpacity(0.5), width: 2),
            left: BorderSide(color: AppColors.gold.withOpacity(0.5), width: 2),
          ),
        ),
      ),
    );
  }
}

/// Custom painter for decorative particles in background
class _DecorativeParticlesPainter extends CustomPainter {
  final double progress;
  
  _DecorativeParticlesPainter({required this.progress});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Draw subtle floating elements
    for (int i = 0; i < 8; i++) {
      final x = size.width * (0.1 + i * 0.12);
      final y = size.height * ((progress + i * 0.1) % 1.0);
      final opacity = 0.05 + 0.05 * (1 - ((progress + i * 0.1) % 1.0));
      
      paint.color = AppColors.gold.withOpacity(opacity);
      canvas.drawCircle(Offset(x, y), 3, paint);
    }
  }
  
  @override
  bool shouldRepaint(_DecorativeParticlesPainter oldDelegate) => true;
}
