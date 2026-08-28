import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../constants/animation_config.dart';
import '../widgets/memory_app_wrapper.dart';

/// Canva Invitation Display Screen
/// Displays the complete Canva invitation with:
/// - BoxFit.contain (no cropping)
/// - Pinch-to-zoom
/// - Pan after zoom
/// - Proper back navigation
class CanvaInvitationScreen extends StatefulWidget {
  const CanvaInvitationScreen({super.key});

  @override
  State<CanvaInvitationScreen> createState() => _CanvaInvitationScreenState();
}

class _CanvaInvitationScreenState extends State<CanvaInvitationScreen>
    with SingleTickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  // Path to Canva invitation image
  // User will replace with their actual Canva export
  static const String invitationPath =
      'assets/images/invitation/anniversary_invitation.png';

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));

    _fadeController.forward();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }

  void _continueToStory() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MemoryAppWrapper(
      intensity: AnimationIntensity.subtle,
      quotePosition: QuotePosition.bottomCenter,
      child: Scaffold(
        backgroundColor: AppColors.creamBackground,
        body: SafeArea(
          child: Stack(
            children: [
              // Background gradient
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.lightCream,
                      AppColors.creamBackground,
                      AppColors.warmBeige.withOpacity(0.3),
                    ],
                  ),
                ),
              ),

              // Main invitation viewer
              Column(
                children: [
                  // Top bar with back button
                  _buildTopBar(context),

                  // Invitation display area
                  Expanded(
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Center(
                        child: InteractiveViewer(
                          transformationController: _transformationController,
                          minScale: 1.0,
                          maxScale: 4.0,
                          boundaryMargin: const EdgeInsets.all(20),
                          child: _buildInvitationImage(),
                        ),
                      ),
                    ),
                  ),

                  // Bottom controls
                  _buildBottomControls(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Back button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
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
                  Icons.arrow_back_ios_new,
                  color: AppColors.primaryBurgundy,
                  size: 20,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Their Invitation',
                  style: AppTypography.cardTitle.copyWith(
                    color: AppColors.primaryBurgundy,
                  ),
                ),
                Text(
                  'Pinch to zoom',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.mediumText,
                  ),
                ),
              ],
            ),
          ),

          // Reset zoom button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _resetZoom,
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
                  Icons.zoom_out_map,
                  color: AppColors.primaryBurgundy,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvitationImage() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.softShadow,
            blurRadius: 30,
            spreadRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          invitationPath,
          // BoxFit.contain ensures the ENTIRE invitation is visible
          // No cropping whatsoever
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback if Canva invitation not found yet
            return _buildPlaceholder();
          },
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: AppColors.lightCream,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.gold.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Icon(
              Icons.card_giftcard,
              size: 80,
              color: AppColors.gold.withOpacity(0.6),
            ),
          ),
          
          const SizedBox(height: 32),
          
          Text(
            'Canva Invitation',
            style: AppTypography.sectionTitle.copyWith(
              color: AppColors.primaryBurgundy,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Please add your Canva invitation image as:\n\nassets/images/invitation/anniversary_invitation.png',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.mediumText,
                height: 1.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          
          const SizedBox(height: 24),
          
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.warmBeige.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.gold.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 18,
                      color: AppColors.mediumText,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'How to add your invitation:',
                      style: AppTypography.label.copyWith(
                        color: AppColors.darkText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '1. Export your Canva design as PNG\n'
                  '2. Save as anniversary_invitation.png\n'
                  '3. Place in assets/images/invitation/\n'
                  '4. Reload the app',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.mediumText,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: AppColors.softShadow,
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Decorative line
            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Continue button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _continueToStory,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBurgundy,
                  foregroundColor: AppColors.whiteText,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 6,
                  shadowColor: AppColors.primaryBurgundy.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue Their Story',
                      style: AppTypography.button,
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
            
            const SizedBox(height: 12),
            
            // Helper text
            Text(
              'Tap above to continue to their journey',
              style: AppTypography.caption.copyWith(
                color: AppColors.lightText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
