import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class HighlightedHeading extends StatelessWidget {
  const HighlightedHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = Styles.textStyle24W500ClashDisplay.copyWith(
      color: Colors.white,
      fontSize: 20.sp,
      height: 1.45,
    );

    return Text.rich(
      TextSpan(
        style: baseStyle,
        children: [
          const TextSpan(text: 'Transform Your Wardrobe\n'),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
              decoration: const ShapeDecoration(
                shape: CircleBorder(
                  eccentricity: 1,
                  side: BorderSide(color: Color(0xB3FFFFFF), width: 1),
                ),
              ),
              child: Text(
                'Discover and Shop',
                style: baseStyle.copyWith(color: AppColors.primary),
              ),
            ),
          ),
          const TextSpan(text: ' Trends\nwith Our Fashion App'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
