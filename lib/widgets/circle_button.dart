import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final double width;
  final double height;
  const CircleButton({
    super.key,
    required this.child,
    this.onTap,
    this.width = 58,
    this.height = 58,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.r,
        height: height.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF0F0F0F),
          border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
        ),
        child: Center(child: child),
      ),
    );
  }
}
