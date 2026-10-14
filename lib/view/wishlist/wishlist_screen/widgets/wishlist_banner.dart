import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_string.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_elevated_button.dart';

import '../../../../core/constants/app_size.dart';

Widget wishlistBanner() {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: AppSize.s24.w,
      vertical: AppSize.s40.h,
    ),
    height: AppSize.s296.h,
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: AssetImage(AssetsData.wishlistBannerBackground),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(AppSize.s32.r),
      border: Border.all(
        color: AppColors.whiteText.withOpacity(0.06),
        width: AppSize.s1.w,
      ),
      color: AppColors.backgroundItem,
    ),
    child: Column(
      children: [
        const Spacer(),
        Text(
          AppString.yourCuratedArchive,
          style: Styles.textStyle13W400PlusJakartaSans.copyWith(
            color: AppColors.tabTextColor,
          ),
        ),
        Text(
          AppString.curatedArchiveDescription,
          style: Styles.textStyle24W400BodoniModa.copyWith(
            color: AppColors.whiteText,
          ),
        ),
        CustomElevatedButton(
          onPressed: () {},
          color: Colors.transparent,
          width: AppSize.s237.w,
          child: Row(
            children: [
              Image.asset(
                AssetsData.iconArchiveSvg,
                color: AppColors.whiteText,
                width: AppSize.s15.w,
                height: AppSize.s15.h,
              ),
              Text(
                AppString.discoverNewArrivals,
                style: Styles.textStyle16W500PlusJakartaSans.copyWith(
                  color: AppColors.whiteText,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
