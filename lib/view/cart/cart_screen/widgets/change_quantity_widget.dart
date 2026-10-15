import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/cart/cart_controller/cart_controller.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_button.dart';

class ChangeQuantityWidget extends StatelessWidget {
  const ChangeQuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              onPressed: () {
                controller.increaseQuantity();
              },
              backgroundColor: AppColors.backgroundButtonGrey,
              text: '+',
              textStyle: Styles.textStyle16W500ClashDisplay.copyWith(
                color: AppColors.whiteText,
              ),
            ),
            Text(
              controller.quantity.toString(),
              style: Styles.textStyle16W500ClashDisplay.copyWith(
                color: AppColors.whiteText,
              ),
            ),
            CustomButton(
              onPressed: () {
                controller.decreaseQuantity();
              },
              backgroundColor: AppColors.backgroundButtonGrey,
              textStyle: Styles.textStyle16W500ClashDisplay.copyWith(
                color: AppColors.whiteText,
              ),
              text: '-',
            ),
          ],
        );
      },
    );
  }
}
