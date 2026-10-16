import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/cart_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/cart/cart_screen/widgets/cart_item.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_size.dart';
import '../../../core/constants/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.s20.w,
        vertical: AppSize.s12.h,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: CircleButton(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              AssetsData.iconArrowBackSvg,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            'CART',
            style: Styles.textStyle20W500BodoniModa.copyWith(
              color: AppColors.whiteText,
            ),
          ),

          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          actions: [
            CircleButton(
              child: SvgPicture.asset(AssetsData.iconHeartOutlineSvg),
            ),
          ],
        ),
        body: Obx(() {
          if (controller.cartItems.isEmpty) {
            return Center(
              child: Text(
                'No Items available',
                style: Styles.textStyle16W500ClashDisplay.copyWith(
                  color: AppColors.lightPrimaryText,
                ),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.s30.h),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return CartItem(
                  size: 'XL',
                  product: controller.cartItems[index],
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s14.h),
                  child: Divider(
                    thickness: AppSize.s1.sp,
                    color: AppColors.white.withOpacity(0.15),
                  ),
                );
              },
              itemCount: controller.cartItems.length,
            ),
          );
        }),
      ),
    );
  }
}
