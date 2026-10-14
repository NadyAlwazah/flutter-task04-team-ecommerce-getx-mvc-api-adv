import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_string.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/cart/cart_screen/widgets/change_quantity_widget.dart';

import '../../../../core/constants/app_size.dart';

class CartItem extends StatelessWidget {
  final String size;
  final ProductModel product;
  const CartItem({super.key, required this.size, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s141.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.whiteText.withOpacity(0.15),
          width: AppSize.s1.w,
        ),
      ),
      child: Row(
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
                errorBuilder: (context, errror, stackTrace) {
                  return Image.asset(
                    AssetsData.imageDefault,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: Styles.textStyle16W500ClashDisplay.copyWith(
                  color: AppColors.whiteText,
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
                  color: AppColors.greyText,
                ),
              ),
              const ChangeQuantityWidget(),
              const Spacer(),
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
                  child: Image.asset(
                    AssetsData.iconDeleteSvg,
                    width: AppSize.s20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
