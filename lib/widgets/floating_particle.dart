import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/animation_config.dart';

/// Individual floating particle element
class FloatingParticle extends StatefulWidget {
  final double intensity;
  
  const FloatingParticle({
    super.key,
    this.intensity = 1.0,
  });
  
  @override
  State<FloatingParticle> createState() => _FloatingParticleState();
}

class _FloatingParticleState extends State<FloatingParticle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _yAnimation;
  late Animation<double> _xAnimation;
  late Animation<double> _opacityAnimation;
  
  late double _startX;
  late double _size;
  late double _maxOpacity;
  late double _horizontalDrift;
  
  final Random _random = Random();
  
  @override
  void initState() {
    super.initState();
    _initializeProperties();
    _setupAnimation();
  }
  
  void _initializeProperties() {
    _startX = _random.nextDouble();
    _size = AnimationConfig.minParticleSize + 
        _random.nextDouble() * 
        (AnimationConfig.maxParticleSize - AnimationConfig.minParticleSize);
    _maxOpacity = (AnimationConfig.minParticleOpacity + 
        _random.nextDouble() * 
        (AnimationConfig.maxParticleOpacity - AnimationConfig.minParticleOpacity)) * 
        widget.intensity;
    _horizontalDrift = (_random.nextDouble() - 0.5) * 0.15;
  }
  
  void _setupAnimation() {
    final duration = Duration(
      milliseconds: 10000 + _random.nextInt(8000),
    );
    
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    
    // Vertical movement
    _yAnimation = Tween<double>(
      begin: 1.0,
      end: -0.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    
    // Horizontal drift
    _xAnimation = Tween<double>(
      begin: 0.0,
      end: _horizontalDrift,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    
    // Opacity fade in/out
    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0),
        weight: 20,
      ),
    ]).animate(_controller);
    
    _controller.repeat();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final size = MediaQuery.of(context).size;
        
        return Positioned(
          left: size.width * (_startX + _xAnimation.value),
          top: size.height * _yAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value * _maxOpacity,
            child: Container(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                color: AnimationConfig.particleColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AnimationConfig.particleColor.withOpacity(0.3),
                    blurRadius: _size * 0.8,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
