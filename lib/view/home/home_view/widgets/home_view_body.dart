import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/discover_banner.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/home_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 28.0.h,
        left: AppSize.s24.w,
        right: AppSize.s24.w,
      ),
      child: Column(
        children: [
          const HomeHeader(),
          SizedBox(height: 32.h),
          const DiscoverBanner(),
        ],
      ),
    );
  }
}
