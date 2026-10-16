import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_size.dart';
import '../../../../widgets/custom_button.dart';

Widget wishlistBanner() {
  return Container(
    padding: EdgeInsets.only(
      right: AppSize.s24.w,
      left: AppSize.s24.w,
      bottom: AppSize.s24.h,
      top: AppSize.s4.h,
    ),
    height: AppSize.s296.h,
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: AssetImage(AssetsData.wishlistBannerBackground),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(AppSize.s32.r),
      border: Border.all(
        color: AppColors.white.withOpacity(0.06),
        width: AppSize.s1.w,
      ),
      //color: AppColors.backgroundItem,
    ),
    child: Column(
      spacing: AppSize.s4.h,
      children: [
        const Spacer(),
        Text(
          'Your Curated Archive',
          style: Styles.textStyle24W400BodoniModa.copyWith(
            color: AppColors.tabTextColor,
          ),
        ),
        Text(
          'Items saved to your personal sanctuary remain reserved for 14 days before returning to the global collection\n',
          textAlign: TextAlign.center,
          style: Styles.textStyle13W400PlusJakartaSans.copyWith(
            color: AppColors.whiteText,
          ),
        ),
        SizedBox(
          width: AppSize.s237.w,
          child: CustomButton(
            onPressed: () {
              Get.find<BottomBarController>().changeTab(0);
            },
            icon: SvgPicture.asset(AssetsData.iconArchiveSvg),
            backgroundColor: AppColors.greyBannerButtonBackground,
            text: 'DISCOVER NEW ARRIVALS',
            textStyle: Styles.textStyle12W500PlusJakartaSans.copyWith(
              color: AppColors.whiteText,
            ),
            iconTextSpacing: AppSize.s8.w,
            radius: AppSize.s9999.r,
          ),
        ),
      ],
    ),
  );
}
