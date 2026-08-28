import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/animation_config.dart';

/// Individual floating heart with complex animations
class AnimatedFloatingHeart extends StatefulWidget {
  final double intensity;
  
  const AnimatedFloatingHeart({
    super.key,
    this.intensity = 1.0,
  });
  
  @override
  State<AnimatedFloatingHeart> createState() => _AnimatedFloatingHeartState();
}

class _AnimatedFloatingHeartState extends State<AnimatedFloatingHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _yAnimation;
  late Animation<double> _xAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _opacityAnimation;
  
  late double _startX;
  late double _size;
  late double _maxOpacity;
  late double _horizontalDrift;
  late double _rotationAmount;
  late HeartStyle _style;
  
  final Random _random = Random();
  
  @override
  void initState() {
    super.initState();
    _initializeProperties();
    _setupAnimation();
  }
  
  void _initializeProperties() {
    _startX = _random.nextDouble();
    _size = AnimationConfig.minHeartSize + 
        _random.nextDouble() * 
        (AnimationConfig.maxHeartSize - AnimationConfig.minHeartSize);
    _maxOpacity = (AnimationConfig.minHeartOpacity + 
        _random.nextDouble() * 
        (AnimationConfig.maxHeartOpacity - AnimationConfig.minHeartOpacity)) * 
        widget.intensity;
    _horizontalDrift = (_random.nextDouble() - 0.5) * 0.2;
    _rotationAmount = (_random.nextDouble() - 0.5) * 0.3;
    
    // Random heart style
    final styleIndex = _random.nextInt(3);
    _style = HeartStyle.values[styleIndex];
  }
  
  void _setupAnimation() {
    final baseDuration = AnimationConfig.minHeartDuration.inMilliseconds;
    final durationRange = AnimationConfig.maxHeartDuration.inMilliseconds - baseDuration;
    final duration = Duration(
      milliseconds: baseDuration + _random.nextInt(durationRange),
    );
    
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    
    // Vertical movement (bottom to top)
    _yAnimation = Tween<double>(
      begin: 1.0,
      end: -0.15,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    
    // Horizontal drift (sine wave motion)
    _xAnimation = Tween<double>(
      begin: 0.0,
      end: _horizontalDrift,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    
    // Subtle rotation
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: _rotationAmount,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    
    // Opacity fade in/out
    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 15,
      ),
    ]).animate(_controller);
    
    // Start immediately without delay for testing
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
          left: size.width * (_startX + _xAnimation.value * sin(_controller.value * pi * 2)),
          top: size.height * _yAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: Opacity(
              opacity: _opacityAnimation.value * _maxOpacity,
              child: _buildHeart(),
            ),
          ),
        );
      },
    );
  }
  
  Widget _buildHeart() {
    switch (_style) {
      case HeartStyle.filled:
        return Icon(
          Icons.favorite,
          size: _size,
          color: AnimationConfig.heartColor,
        );
      case HeartStyle.outline:
        return Icon(
          Icons.favorite_border,
          size: _size,
          color: AnimationConfig.heartColor,
        );
      case HeartStyle.glowing:
        return Container(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AnimationConfig.heartColor.withOpacity(0.4),
                blurRadius: _size * 0.6,
                spreadRadius: _size * 0.1,
              ),
            ],
          ),
          child: Icon(
            Icons.favorite,
            size: _size,
            color: AnimationConfig.heartColor,
          ),
        );
    }
  }
}

enum HeartStyle {
  filled,
  outline,
  glowing,
}
