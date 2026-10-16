import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_view/widgets/custom_bottom_bar.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';
import 'package:get/get.dart';

import '../core/constants/app_colors.dart';
import '../models/product_model.dart';

class AppActionDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final ProductModel product;
  final String buttonText;

  const AppActionDialog({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    required this.product,
    this.buttonText = 'Continue',
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.s24.w,
          vertical: AppSize.s24.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: AppSize.s48.sp, color: AppColors.priceColor),

            SizedBox(height: AppSize.s16.h),

            Text(
              title,
              textAlign: TextAlign.center,
              style: Styles.textStyle20W600ClashDisplay.copyWith(
                color: AppColors.whiteText,
              ),
            ),

            SizedBox(height: AppSize.s10.h),

            Text(
              message,
              textAlign: TextAlign.center,
              style: Styles.textStyle14W500ClashDisplay.copyWith(
                color: AppColors.tabTextColor,
              ),
            ),

            SizedBox(height: AppSize.s18.h),

            Text(
              product.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle16W500ClashDisplay.copyWith(
                color: AppColors.whiteText,
              ),
            ),

            SizedBox(height: AppSize.s24.h),
            CustomButton(
              onPressed: () => Get.back(),
              backgroundColor: AppColors.priceColor,
              textColor: AppColors.whiteText,
              padding: EdgeInsets.symmetric(vertical: AppSize.s14.h),
              radius: AppSize.s12.r,
              text: buttonText,
            ),
            /*SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.priceColor,
                  foregroundColor: AppColors.whiteText,
                  padding: EdgeInsets.symmetric(vertical: AppSize.s14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12.r),
                  ),
                ),
                child: Text(buttonText),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
