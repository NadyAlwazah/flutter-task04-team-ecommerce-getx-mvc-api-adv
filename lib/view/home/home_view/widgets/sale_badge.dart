import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class SaleBadge extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final String assetName;
  final double rotationAngle;

  const SaleBadge({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    required this.assetName,
    this.rotationAngle = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(assetName, width: 52.r, height: 52.r),

        Transform.rotate(
          angle: rotationAngle,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                primaryText,
                style: Styles.textStyle14W500ClashDisplay.copyWith(
                  fontSize: 11.7.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),

              Text(
                secondaryText,
                style: Styles.textStyle14W500ClashDisplay.copyWith(
                  fontSize: 8.1.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
