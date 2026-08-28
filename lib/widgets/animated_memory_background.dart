import 'package:flutter/material.dart';
import '../constants/animation_config.dart';
import 'animated_floating_heart.dart';
import 'floating_particle.dart';

/// Reusable animated background with floating hearts and particles
/// Use this widget as a background layer throughout the app
class AnimatedMemoryBackground extends StatelessWidget {
  final AnimationIntensity intensity;
  final Widget child;
  
  const AnimatedMemoryBackground({
    super.key,
    this.intensity = AnimationIntensity.normal,
    required this.child,
  });
  
  @override
  Widget build(BuildContext context) {
    final intensityValue = AnimationConfig.intensityLevels[intensity] ?? 0.8;
    
    // Calculate counts based on intensity  
    final heartCount = (AnimationConfig.heartCount * intensityValue).round();
    final particleCount = (AnimationConfig.particleCount * intensityValue).round();
    
    print('🎨 Animation Debug: intensity=$intensity, hearts=$heartCount, particles=$particleCount');
    
    return Stack(
      children: [
        // Content layer FIRST (bottom)
        child,
        
        // Animated overlay layer ON TOP (so we can see it)
        Positioned.fill(
          child: IgnorePointer(
            child: _AnimationLayer(
              heartCount: heartCount,
              particleCount: particleCount,
              intensity: intensityValue,
            ),
          ),
        ),
      ],
    );
  }
}

/// Internal animation layer widget
class _AnimationLayer extends StatefulWidget {
  final int heartCount;
  final int particleCount;
  final double intensity;
  
  const _AnimationLayer({
    required this.heartCount,
    required this.particleCount,
    required this.intensity,
  });
  
  @override
  State<_AnimationLayer> createState() => _AnimationLayerState();
}

class _AnimationLayerState extends State<_AnimationLayer>
    with WidgetsBindingObserver {
  bool _isActive = true;
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (AnimationConfig.pauseWhenInBackground) {
      setState(() {
        _isActive = state == AppLifecycleState.resumed;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    if (!_isActive) {
      return const SizedBox.shrink();
    }
    
    print('✨ AnimationLayer rendering: ${widget.heartCount} hearts, ${widget.particleCount} particles');
    
    return Container(
      color: Colors.transparent, // Ensure container is present
      child: Stack(
        children: [
          // Debug indicator (remove this after confirming animations work)
          Positioned(
            top: 100,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '❤️ ${widget.heartCount} hearts',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          
          // Floating hearts
          ...List.generate(
            widget.heartCount,
            (index) => AnimatedFloatingHeart(
              key: ValueKey('heart_$index'),
              intensity: widget.intensity,
            ),
          ),
          
          // Floating particles
          ...List.generate(
            widget.particleCount,
            (index) => FloatingParticle(
              key: ValueKey('particle_$index'),
              intensity: widget.intensity,
            ),
          ),
        ],
      ),
    );
  }
}
