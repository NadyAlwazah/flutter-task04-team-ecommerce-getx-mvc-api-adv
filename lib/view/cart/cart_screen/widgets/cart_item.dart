import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/cart_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/cart/cart_screen/widgets/change_quantity_widget.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_action_dialog.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_size.dart';

class CartItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;
  final ProductModel product;

  const CartItem({
    super.key,
    required this.item,
    required this.index,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final size = item['size'] as String;
    return Row(
      spacing: AppSize.s20.w,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s30.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s30.r),
            child: Image.network(
              product.images.first,
              width: AppSize.s112.w,
              height: AppSize.s141.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(AssetsData.imageDefault, fit: BoxFit.cover);
              },
            ),
          ),
        ),
        Expanded(
          child: Column(
            spacing: AppSize.s5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: Styles.textStyle16W500ClashDisplay.copyWith(
                  color: AppColors.whiteText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Size: $size',
                style: Styles.textStyle14W500ClashDisplay.copyWith(
                  color: AppColors.greyText,
                ),
              ),
              Text(
                '\$${product.price}',
                style: Styles.textStyle14W500ClashDisplay.copyWith(
                  color: AppColors.price2Color,
                ),
              ),
              ChangeQuantityWidget(index: index),
            ],
          ),
        ),
        Container(
          height: AppSize.s118.h,
          width: AppSize.s36.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s40.r),
            border: Border.all(
              color: AppColors.whiteText.withOpacity(0.15),
              width: AppSize.s1.w,
            ),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () async {
                final removed = await Get.find<CartController>().removeFromCart(
                  productId: product.id,
                  size: size,
                );
                if (removed) {
                  Get.dialog(
                    AppActionDialog(
                      title: 'Removed From Cart',
                      message: 'This product has been removed from your cart',
                      icon: Icons.remove_shopping_cart_outlined,
                      product: product,
                    ),
                  );
                }
              },
              child: SvgPicture.asset(AssetsData.iconDeleteSvg),
            ),
          ),
        ),
      ],
    );
  }
}
