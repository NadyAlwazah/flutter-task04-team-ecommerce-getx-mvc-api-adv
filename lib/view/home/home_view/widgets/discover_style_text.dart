import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class DiscoverStyleText extends StatelessWidget {
  const DiscoverStyleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          'STYLE',
          style: Styles.textStyle34W500ClashDisplay.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SvgPicture.asset(
          AssetsData.iconDiscoverStyleOuterFrameSvg,
          width: 130.w,
          height: 36.h,
        ),
        SvgPicture.asset(
          AssetsData.iconDiscoverStyleInnerFrameSvg,
          width: 130.w,
          height: 36.h,
        ),
      ],
    );
  }
}
