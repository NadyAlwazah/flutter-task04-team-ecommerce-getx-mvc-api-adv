import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_size.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? color;
  final Color? shadowColor;
  final Color? borderColor;
  final BorderSide? borderSide;
  final double? width;
  final Widget? child;
  final double? elevation;
  final double? height;
  final double? marginTop;
  final double? marginBottom;
  final double? marginStart;
  final double? marginEnd;
  final double? borderRadius;
  final bool isSmallButton;

  final Function() onPressed;
  final EdgeInsetsGeometry? padding;
  final bool? loading;
  final bool? notEnable;
  final bool showCircle;
  final Gradient? gradient;

  const CustomElevatedButton({
    super.key,
    this.isSmallButton = false,
    this.borderRadius,
    this.width,
    this.height,
    required this.onPressed,
    this.borderSide,
    this.elevation,
    this.child,
    this.padding,
    this.loading,
    this.notEnable,
    this.color,
    this.shadowColor,
    this.marginTop,
    this.marginBottom,
    this.marginStart,
    this.marginEnd,
    this.showCircle = true,
    this.gradient,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: notEnable ?? false,
      child: Container(
        margin: EdgeInsetsDirectional.only(
          top: marginTop ?? 0,
          bottom: marginBottom ?? 0,
          start: marginStart ?? 0,
          end: marginEnd ?? 0,
        ),
        height: height ?? (isSmallButton ? AppSize.s40.h : AppSize.s60.h),
        width: width ?? (isSmallButton ? AppSize.s139.w : AppSize.s327.w),
        decoration: BoxDecoration(
          gradient: gradient,
          border: Border.all(color: borderColor ?? AppColors.primary),
        ),

        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: padding,
            elevation: elevation,
            backgroundColor:
                color ??
                (isSmallButton ? Colors.transparent : AppColors.primary),
            shadowColor: shadowColor,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ??
                    (isSmallButton ? AppSize.s9999.r : AppSize.s150.r),
              ),
              side: borderSide ?? BorderSide.none,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
