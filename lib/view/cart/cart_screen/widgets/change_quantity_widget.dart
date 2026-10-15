import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:get/get.dart';

import '../../../../controllers/cart_controller.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../widgets/custom_button.dart';

class ChangeQuantityWidget extends StatelessWidget {
  const ChangeQuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Row(
          spacing: AppSize.s13.w,
          children: [
            SizedBox(
              height: AppSize.s24.h,
              width: AppSize.s34.w,
              child: CustomButton(
                radius: AppSize.s20.r,
                onPressed: () {
                  controller.increaseQuantity();
                },
                backgroundColor: AppColors.backgroundButtonGrey,
                text: '+',
                textStyle: Styles.textStyle16W500ClashDisplay.copyWith(
                  color: AppColors.whiteText,
                ),
              ),
            ),
            Text(
              controller.quantity.toString(),
              style: Styles.textStyle16W500ClashDisplay.copyWith(
                color: AppColors.whiteText,
              ),
            ),
            SizedBox(
              height: AppSize.s24.h,
              width: AppSize.s34.w,
              child: CustomButton(
                onPressed: () {
                  controller.decreaseQuantity();
                },
                radius: AppSize.s20.r,
                backgroundColor: AppColors.backgroundButtonGrey,
                textStyle: Styles.textStyle16W500ClashDisplay.copyWith(
                  color: AppColors.whiteText,
                ),
                text: '-',
              ),
            ),
          ],
        );
      },
    );
  }
}
