import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_loader.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? radius;
  final Color? loadingColor;
  final double iconTextSpacing;
  final Color backgroundColor;
  final bool withSide;
  final Color textColor;
  final Widget? trailing;
  final Color borderColor;
  final double heightButton;
  final bool iconOnRight;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.radius,
    this.loadingColor,
    this.iconTextSpacing = 20,
    this.backgroundColor = AppColors.primary,
    this.withSide = false,
    this.textColor = Colors.white,
    this.trailing,
    this.borderColor = Colors.black,
    this.heightButton = 48,
    this.iconOnRight = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
        minimumSize: Size(double.infinity, heightButton.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 8.r),
          side: withSide ? BorderSide(color: borderColor) : BorderSide.none,
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: AppLoader(color: loadingColor),
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!iconOnRight && icon != null) ...[
                      icon!,
                      SizedBox(width: iconTextSpacing.w),
                    ],

                    Text(
                      text ?? '',
                      style:
                          textStyle ??
                          Styles.textStyle24W500ClashDisplay.copyWith(
                            color: textColor,
                            fontSize: 24.sp,
                          ),
                    ),

                    if (iconOnRight && icon != null) ...[
                      SizedBox(width: iconTextSpacing.w),
                      icon!,
                    ],
                  ],
                ),

                if (trailing != null) Positioned(right: 0, child: trailing!),
              ],
            ),
    );
  }
}
