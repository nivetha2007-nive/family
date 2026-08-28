import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/animation_config.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'quote_manager.dart';

/// Love quote overlay widget - displays timed quotes elegantly
class LoveQuoteOverlay extends StatefulWidget {
  final QuotePosition position;
  
  const LoveQuoteOverlay({
    super.key,
    this.position = QuotePosition.topCenter,
  });
  
  @override
  State<LoveQuoteOverlay> createState() => _LoveQuoteOverlayState();
}

class _LoveQuoteOverlayState extends State<LoveQuoteOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  
  final QuoteManager _quoteManager = QuoteManager();
  
  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _quoteManager.addListener(_onQuoteChanged);
  }
  
  void _setupAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: AnimationConfig.quoteFadeInDuration + 
          AnimationConfig.quoteDisplayDuration + 
          AnimationConfig.quoteFadeOutDuration,
    );
    
    // Fade animation
    _fadeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 20,
      ),
    ]).animate(_controller);
    
    // Scale animation
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.8, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.95)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 20,
      ),
    ]).animate(_controller);
    
    // Slide animation
    _slideAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, -0.5),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(begin: Offset.zero, end: Offset.zero),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, -0.3),
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 20,
      ),
    ]).animate(_controller);
  }
  
  void _onQuoteChanged() {
    if (_quoteManager.isVisible && _quoteManager.currentQuote != null) {
      _controller.forward(from: 0.0);
    }
  }
  
  @override
  void dispose() {
    _quoteManager.removeListener(_onQuoteChanged);
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _quoteManager,
      builder: (context, child) {
        if (!_quoteManager.isVisible || _quoteManager.currentQuote == null) {
          return const SizedBox.shrink();
        }
        
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Positioned(
              top: _getTopPosition(context),
              left: 16,
              right: 16,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: _buildQuoteCard(),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
  
  double _getTopPosition(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    switch (widget.position) {
      case QuotePosition.topCenter:
        return screenHeight * 0.15;
      case QuotePosition.center:
        return screenHeight * 0.4;
      case QuotePosition.bottomCenter:
        return screenHeight * 0.7;
    }
  }
  
  Widget _buildQuoteCard() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: AnimationConfig.quoteBackgroundColor.withOpacity(0.95),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.gold.withOpacity(0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.softShadow,
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                  BoxShadow(
                    color: AppColors.gold.withOpacity(0.1),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Heart icon
                  const Icon(
                    Icons.favorite,
                    size: 20,
                    color: AppColors.deepRed,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Quote text
                  Text(
                    _quoteManager.currentQuote!,
                    style: AppTextStyles.quote.copyWith(
                      fontSize: 15,
                      height: 1.6,
                      color: AnimationConfig.quoteTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Decorative line
                  Container(
                    width: 60,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.gold.withOpacity(0),
                          AppColors.gold,
                          AppColors.gold.withOpacity(0),
                        ],
                      ),
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

/// Quote position options
enum QuotePosition {
  topCenter,
  center,
  bottomCenter,
}
