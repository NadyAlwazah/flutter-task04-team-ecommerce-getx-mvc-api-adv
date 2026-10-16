import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';

/// دائرة زخرفية رفيعة مع نقطة اختيارية على محيطها.
class OrbitCircle extends StatelessWidget {
  const OrbitCircle({
    super.key,
    required this.diameter,
    this.dotAngle,
    this.dotSize = 14,
  });

  /// القطر بوحدات Figma.
  final double diameter;

  /// زاوية النقطة بالراديان (إحداثيات الشاشة). null = بدون نقطة.
  final double? dotAngle;
  final double dotSize;

  @override
  Widget build(BuildContext context) {
    final size = diameter.r;
    final dot = dotSize.r;
    final radius = size / 2;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.orbitLine, width: 1),
              ),
            ),
          ),
          if (dotAngle != null)
            Positioned(
              left: radius + radius * math.cos(dotAngle!) - dot / 2,
              top: radius + radius * math.sin(dotAngle!) - dot / 2,
              child: Container(
                width: dot,
                height: dot,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.orbitDot,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
