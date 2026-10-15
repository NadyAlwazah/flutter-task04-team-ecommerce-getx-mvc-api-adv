import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_string.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

Widget itemCountWidget({required int count}) {
  return Container(
    height: AppSize.s26.h,
    padding: EdgeInsets.symmetric(
      horizontal: AppSize.s12.w,
      vertical: AppSize.s4.h,
    ),
    decoration: BoxDecoration(
      color: AppColors.backgroundItem,
      borderRadius: BorderRadius.circular(AppSize.s9999.r),
      border: Border.all(
        color: AppColors.whiteText.withOpacity(0.05),
        width: AppSize.s1.w,
      ),
    ),
    child: Text(
      '$count ${AppString.items}',
      style: Styles.textStyle12W500PlusJakartaSans.copyWith(
        color: AppColors.priceColor,
      ),
    ),
  );
}
