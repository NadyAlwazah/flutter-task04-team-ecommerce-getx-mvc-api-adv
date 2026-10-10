import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/icon_with_badge.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WELCOME,',
                style: Styles.textStyle14W500ClashDisplay.copyWith(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
              Text(
                'UTTAMVORA',
                style: Styles.textStyle14W500ClashDisplay.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),

        CircleButton(
          onTap: () {},
          child: SvgPicture.asset(
            AssetsData.iconSearchSvg,
            width: 24.r,
            height: 24.r,
          ),
        ),

        SizedBox(width: 14.w),

        CircleButton(
          onTap: () {},
          child: IconWithBadge(
            count: 2,
            child: SvgPicture.asset(
              AssetsData.iconBagWelcomeSvg,
              width: 24.r,
              height: 24.r,
            ),
          ),
        ),
      ],
    );
  }
}
