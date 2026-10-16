import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class NotificationActionBadge extends StatelessWidget {
  final String text;
  final String? iconPath;
  final Color backgroundColor;
  final Color textColor;
  final double? iconSize;

  const NotificationActionBadge({
    super.key,
    required this.text,
    this.iconPath,
    required this.backgroundColor,
    this.textColor = AppColors.white,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null && iconPath!.isNotEmpty) ...[
            SvgPicture.asset(
              iconPath!,
              width: (iconSize ?? 14).w,
              height: (iconSize ?? 14).h,
            ),
            SizedBox(width: 4.w),
          ],
          Text(
            text,
            style: Styles.textStyle12W500PlusJakartaSans.copyWith(
              color: textColor,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}