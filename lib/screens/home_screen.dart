import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../constants/app_constants.dart';
import '../constants/animation_config.dart';
import '../widgets/memory_app_wrapper.dart';
import 'story_screen.dart';
import 'photo_gallery_screen.dart';
import 'video_memories_screen.dart';
import 'letter_screen.dart';
import 'celebration_screen.dart';
import 'video_invitation_screen.dart';

/// Premium Home Screen - Main Hub
/// Features: Responsive card-based navigation, elegant design, mobile-optimized
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _cardAnimations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Staggered card animations
    _cardAnimations = List.generate(6, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.1,
            0.5 + (index * 0.1),
            curve: Curves.easeOut,
          ),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToScreen(Widget screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.05, 0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              )),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;

    return MemoryAppWrapper(
      intensity: AnimationIntensity.enhanced,
      quotePosition: QuotePosition.bottomCenter,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.creamBackground,
                  AppColors.lightCream,
                  AppColors.warmBeige.withOpacity(0.3),
                ],
              ),
            ),
            child: CustomScrollView(
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: _buildHeader(isSmallScreen),
                ),

                // Navigation Cards
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 16 : 24,
                    vertical: 16,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildNavigationCard(
                        index: 0,
                        title: 'Their Story',
                        subtitle: 'A journey through 20 years',
                        icon: Icons.auto_stories_outlined,
                        gradient: const LinearGradient(
                          colors: [AppColors.primaryBurgundy, AppColors.deepRed],
                        ),
                        onTap: () => _navigateToScreen(const StoryScreen()),
                      ),
                      const SizedBox(height: 16),
                      _buildNavigationCard(
                        index: 1,
                        title: 'Photo Memories',
                        subtitle: 'Cherished moments captured',
                        icon: Icons.photo_library_outlined,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.deepRed,
                            AppColors.primaryBurgundy.withOpacity(0.8),
                          ],
                        ),
                        onTap: () => _navigateToScreen(const PhotoGalleryScreen()),
                      ),
                      const SizedBox(height: 16),
                      _buildNavigationCard(
                        index: 2,
                        title: 'Video Memories',
                        subtitle: 'Moments that move us',
                        icon: Icons.video_library_outlined,
                        gradient: const LinearGradient(
                          colors: [AppColors.gold, Color(0xFFD4A574)],
                        ),
                        onTap: () => _navigateToScreen(const VideoMemoriesScreen()),
                      ),
                      const SizedBox(height: 16),
                      _buildNavigationCard(
                        index: 3,
                        title: 'My Letter',
                        subtitle: 'Words from the heart',
                        icon: Icons.mail_outline,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryBurgundy.withOpacity(0.7),
                            AppColors.gold.withOpacity(0.8),
                          ],
                        ),
                        onTap: () => _navigateToScreen(const LetterScreen()),
                      ),
                      const SizedBox(height: 24),
                      // 20th Anniversary Special Card
                      _buildAnniversaryCard(index: 4),
                      const SizedBox(height: 100),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 20 : 32),
      child: Column(
        children: [
          const SizedBox(height: 20),

          // Heart icon
          FadeTransition(
            opacity: _cardAnimations[0],
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.deepRed.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.favorite,
                size: 50,
                color: AppColors.deepRed,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Main title
          FadeTransition(
            opacity: _cardAnimations[0],
            child: Text(
              '20 Years of Love',
              style: AppTypography.mainTitle.copyWith(
                fontSize: isSmallScreen ? 30 : 36,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 16),

          // Couple names
          FadeTransition(
            opacity: _cardAnimations[0],
            child: Text(
              '${AppConstants.groomName} & ${AppConstants.brideName}',
              style: AppTypography.coupleNames.copyWith(
                fontSize: isSmallScreen ? 20 : 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 12),

          // Divider
          FadeTransition(
            opacity: _cardAnimations[0],
            child: Container(
              width: 100,
              height: 3,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.gold,
                    AppColors.primaryBurgundy,
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Subtitle
          FadeTransition(
            opacity: _cardAnimations[0],
            child: Text(
              'A Beautiful Journey',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.mediumText,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 32),

          // "Begin Our Story" button - Opens video invitation
          FadeTransition(
            opacity: _cardAnimations[0],
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
                ),
              ),
              child: ElevatedButton(
                onPressed: () => _navigateToScreen(const VideoInvitationScreen()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBurgundy,
                  foregroundColor: AppColors.whiteText,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                  shadowColor: AppColors.primaryBurgundy.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.play_circle_outline,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Begin Our Story',
                      style: AppTypography.button.copyWith(
                        color: AppColors.whiteText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationCard({
    required int index,
    required String title,
    required String subtitle,
    required IconData icon,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return FadeTransition(
      opacity: _cardAnimations[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(_cardAnimations[index]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.gold.withOpacity(0.2),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.softShadow,
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Icon container
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.softShadow,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      icon,
                      color: AppColors.whiteText,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTypography.cardTitle,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          subtitle,
                          style: AppTypography.cardSubtitle,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Arrow
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: AppColors.mediumText.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnniversaryCard({required int index}) {
    return FadeTransition(
      opacity: _cardAnimations[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(_cardAnimations[index]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _navigateToScreen(const CelebrationScreen()),
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryBurgundy,
                    AppColors.deepRed,
                    Color(0xFF8B0A1F),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBurgundy.withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Celebration icon
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.whiteText.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.celebration,
                      size: 40,
                      color: AppColors.whiteText,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Title
                  Text(
                    '20th Anniversary',
                    style: AppTypography.sectionTitle.copyWith(
                      color: AppColors.whiteText,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  Text(
                    'Celebrate their beautiful journey',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.whiteText.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  // View button
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteText,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View Celebration',
                          style: AppTypography.button.copyWith(
                            color: AppColors.primaryBurgundy,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 18,
                          color: AppColors.primaryBurgundy,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
