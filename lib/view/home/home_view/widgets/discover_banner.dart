import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/discover_style_text.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/sale_badge.dart';

class DiscoverBanner extends StatelessWidget {
  const DiscoverBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 126.h,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'DISCOVER',
                  style: Styles.textStyle34W500ClashDisplay.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'YOUR NEXT',
                  style: Styles.textStyle34W500ClashDisplay.copyWith(
                    color: Colors.white,
                    height: 1,
                  ),
                ),

                const DiscoverStyleText(),
              ],
            ),
          ),

          const Positioned(
            top: 0,
            left: 0,
            child: SaleBadge(
              rotationAngle: -0.79866,
              assetName: AssetsData.iconDiscountBadgeSvg,
              primaryText: "-20%",
              secondaryText: "OFF",
            ),
          ),

          const Positioned(
            right: 0,
            bottom: 0,
            child: SaleBadge(
              rotationAngle: 0.51243,
              assetName: AssetsData.iconDiscountBadgeSvg,
              primaryText: "-50%",
              secondaryText: "OFF",
            ),
          ),
        ],
      ),
    );
  }
}
