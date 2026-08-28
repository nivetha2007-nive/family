import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Elegant decorative divider with ornamental design
class DecorativeDivider extends StatelessWidget {
  final double width;
  final Color color;
  
  const DecorativeDivider({
    super.key,
    this.width = 200,
    this.color = AppColors.gold,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withOpacity(0),
                    color,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.favorite,
              size: 16,
              color: color,
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color,
                    color.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Simple ornamental line divider
class OrnamentalDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  
  const OrnamentalDivider({
    super.key,
    this.color = AppColors.gold,
    this.thickness = 2,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: thickness,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(thickness / 2),
      ),
    );
  }
}
