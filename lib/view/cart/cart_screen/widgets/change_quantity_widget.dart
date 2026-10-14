import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/cart/cart_controller/cart_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';

class ChangeQuantityWidget extends StatelessWidget {
  const ChangeQuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomElevatedButton(
              onPressed: () {
                controller.increaseQuantity();
              },
              color: AppColors.backgroundButtonGrey,
              child: Text(
                '+',
                style: Styles.textStyle16W500ClashDisplay.copyWith(
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
            CustomElevatedButton(
              onPressed: () {
                controller.decreaseQuantity();
              },
              color: AppColors.backgroundButtonGrey,
              child: Text(
                '-',
                style: Styles.textStyle16W500ClashDisplay.copyWith(
                  color: AppColors.whiteText,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
