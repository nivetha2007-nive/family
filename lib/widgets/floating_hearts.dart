import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Animated floating hearts effect for celebration screens
class FloatingHearts extends StatefulWidget {
  final int numberOfHearts;
  final Duration duration;
  
  const FloatingHearts({
    super.key,
    this.numberOfHearts = 20,
    this.duration = const Duration(seconds: 4),
  });
  
  @override
  State<FloatingHearts> createState() => _FloatingHeartsState();
}

class _FloatingHeartsState extends State<FloatingHearts>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Heart> _hearts = [];
  final Random _random = Random();
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
    
    // Generate hearts with random properties
    for (int i = 0; i < widget.numberOfHearts; i++) {
      _hearts.add(_Heart(
        delay: _random.nextDouble(),
        startX: _random.nextDouble(),
        endX: _random.nextDouble(),
        size: 15 + _random.nextDouble() * 25,
        opacity: 0.3 + _random.nextDouble() * 0.5,
      ));
    }
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
        return CustomPaint(
          painter: _HeartsPainter(
            hearts: _hearts,
            progress: _controller.value,
          ),
          child: Container(),
        );
      },
    );
  }
}

class _Heart {
  final double delay;
  final double startX;
  final double endX;
  final double size;
  final double opacity;
  
  _Heart({
    required this.delay,
    required this.startX,
    required this.endX,
    required this.size,
    required this.opacity,
  });
}

class _HeartsPainter extends CustomPainter {
  final List<_Heart> hearts;
  final double progress;
  
  _HeartsPainter({
    required this.hearts,
    required this.progress,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    for (var heart in hearts) {
      // Calculate position with delay
      double adjustedProgress = (progress + heart.delay) % 1.0;
      
      // Position
      double x = size.width * (heart.startX + 
          (heart.endX - heart.startX) * sin(adjustedProgress * pi));
      double y = size.height * (1 - adjustedProgress);
      
      // Fade in/out
      double opacity = heart.opacity;
      if (adjustedProgress < 0.1) {
        opacity *= adjustedProgress / 0.1;
      } else if (adjustedProgress > 0.9) {
        opacity *= (1 - adjustedProgress) / 0.1;
      }
      
      // Draw heart
      final paint = Paint()
        ..color = AppColors.deepRed.withOpacity(opacity)
        ..style = PaintingStyle.fill;
      
      _drawHeart(canvas, Offset(x, y), heart.size, paint);
    }
  }
  
  void _drawHeart(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    
    // Heart shape
    path.moveTo(center.dx, center.dy + size * 0.3);
    
    // Left curve
    path.cubicTo(
      center.dx - size * 0.5, center.dy - size * 0.1,
      center.dx - size * 0.5, center.dy - size * 0.5,
      center.dx, center.dy - size * 0.2,
    );
    
    // Right curve
    path.cubicTo(
      center.dx + size * 0.5, center.dy - size * 0.5,
      center.dx + size * 0.5, center.dy - size * 0.1,
      center.dx, center.dy + size * 0.3,
    );
    
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(_HeartsPainter oldDelegate) => true;
}
