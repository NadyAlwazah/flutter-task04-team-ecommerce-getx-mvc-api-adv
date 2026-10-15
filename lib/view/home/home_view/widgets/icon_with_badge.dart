import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';

class IconWithBadge extends StatelessWidget {
  const IconWithBadge({super.key, required this.child, required this.count});

  final Widget child;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,

        Positioned(
          top: 0,
          right: -7,
          child: Container(
            width: 13.r,
            height: 13.r,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
