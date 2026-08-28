import 'package:flutter/material.dart';
import 'animated_memory_background.dart';
import 'love_quote_overlay.dart';
import '../constants/animation_config.dart';

// Export QuotePosition for easy access
export 'love_quote_overlay.dart' show QuotePosition;

/// Global app wrapper that provides consistent animation and quote system
/// Wrap your screen content with this widget
class MemoryAppWrapper extends StatelessWidget {
  final Widget child;
  final AnimationIntensity intensity;
  final QuotePosition quotePosition;
  final bool showQuotes;
  
  const MemoryAppWrapper({
    super.key,
    required this.child,
    this.intensity = AnimationIntensity.normal,
    this.quotePosition = QuotePosition.topCenter,
    this.showQuotes = true,
  });
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated background layer
        AnimatedMemoryBackground(
          intensity: intensity,
          child: child,
        ),
        
        // Quote overlay layer
        if (showQuotes)
          LoveQuoteOverlay(
            position: quotePosition,
          ),
      ],
    );
  }
}
