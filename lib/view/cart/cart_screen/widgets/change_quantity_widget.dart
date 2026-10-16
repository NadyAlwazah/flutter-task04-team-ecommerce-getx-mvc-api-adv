import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:get/get.dart';

import '../../../../controllers/cart_controller.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../widgets/custom_button.dart';

class ChangeQuantityWidget extends StatelessWidget {
  final int index;

  const ChangeQuantityWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Obx(() {
      final quantity = controller.getQuantity(index);

      return Row(
        spacing: AppSize.s13.w,
        children: [
          SizedBox(
            height: AppSize.s24.h,
            width: AppSize.s34.w,
            child: CustomButton(
              padding: EdgeInsets.zero,
              radius: AppSize.s20.r,
              onPressed: () {
                controller.increaseQuantity(index);
              },
              backgroundColor: AppColors.backgroundButtonGrey,
              text: '+',
              textStyle: Styles.textStyle16W500ClashDisplay.copyWith(
                color: AppColors.whiteText,
              ),
            ),
          ),
          Text(
            quantity.toString(),
            style: Styles.textStyle16W500ClashDisplay.copyWith(
              color: AppColors.whiteText,
            ),
          ),
          SizedBox(
            height: AppSize.s24.h,
            width: AppSize.s34.w,
            child: CustomButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                controller.decreaseQuantity(index);
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
    });
  }
}
