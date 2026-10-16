import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/helpful_function/add_to_cart.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_controller/favorite_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';
import 'package:get/get.dart';

import '../../../../core/constants/assets.dart';
import '../../../../widgets/custom_button.dart';

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
                  padding: EdgeInsets.symmetric(vertical: AppSize.s2.h),
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
              GetBuilder<FavoriteController>(
                builder: (controller) {
                  return Positioned(
                    top: AppSize.s10.h,
                    right: AppSize.s10.w,
                    child: CircleButton(
                      onTap: () {
                        controller.toggleFavorite(product);
                      },
                      height: AppSize.s32,
                      width: AppSize.s32,

                      child: SvgPicture.asset(
                        controller.isFavorite(product)
                            ? AssetsData.iconHeartFilledSvg
                            : AssetsData.iconHeartOutlineSvg,
                        color: AppColors.heartFilledColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                  color: AppColors.wishlistItemTitleColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),

              Text(
                product.description,
                style: Styles.textStyle16W500BodoniModa.copyWith(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.whiteText,
                ),
              ),
              Text(
                '\$${product.price}',
                style: Styles.textStyle14W600PlusJakartaSans.copyWith(
                  color: AppColors.price2Color,
                ),
              ),
              SizedBox(
                height: AppSize.s40.h,
                width: AppSize.s139.w,
                child: CustomButton(
                  onPressed: () async {
                    await addToCart(product: product, size: 'L');
                  },
                  radius: AppSize.s9999.r,
                  iconTextSpacing: AppSize.s4,
                  icon: SizedBox(
                    width: AppSize.s11.w,
                    height: AppSize.s14.h,
                    child: SvgPicture.asset(
                      AssetsData.iconBagWelcomeSvg,
                      fit: BoxFit.contain,
                      color: AppColors.black,
                    ),
                  ),
                  textStyle: Styles.textStyle10W600PlusJakartaSans.copyWith(
                    color: AppColors.brownText,
                  ),
                  text: 'ADD TO BAG',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
