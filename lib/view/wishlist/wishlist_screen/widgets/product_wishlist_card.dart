import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_string.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_elevated_button.dart';

import '../../../../core/constants/assets.dart';

class ProductWishlistCard extends StatelessWidget {
  final ProductModel product;
  const ProductWishlistCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.s10.w,
        vertical: AppSize.s10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s32.r),
        color: AppColors.backgroundItem,
        border: Border.all(color: AppColors.whiteText.withOpacity(0.07)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s30.r),
                child: Container(
                  color: Colors.transparent,
                  height: AppSize.s196.h,
                  width: double.infinity,
                  child: Image.network(
                    product.images.first,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AssetsData.imageDefault,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: AppSize.s10.h,
                right: AppSize.s10.w,
                child: CircleButton(
                  height: AppSize.s10.h,
                  width: AppSize.s10.w,
                  child: Image.asset(AssetsData.iconHeartOutlineSvg),
                ),
              ),
            ],
          ),
          Container(
            height: AppSize.s116.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category.name,
                  style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                    color: AppColors.atelierTitle,
                  ),
                ),

                Text(
                  product.description,
                  style: Styles.textStyle16W500BodoniModa.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                Text(
                  '\$${product.price}',
                  style: Styles.textStyle14W600PlusJakartaSans.copyWith(
                    color: AppColors.priceColor,
                  ),
                ),
                SizedBox(height: AppSize.s12.h),
                CustomElevatedButton(
                  onPressed: () {},
                  isSmallButton: true,
                  child: Row(
                    children: [
                      Image.asset(
                        AssetsData.iconBagWelcomeSvg,
                        width: AppSize.s10.w,
                        height: AppSize.s12.h,
                        color: AppColors.black,
                      ),
                      Text(
                        AppString.addToBag,
                        style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                          color: AppColors.brownText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
