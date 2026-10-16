import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/wishlist_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_string.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/product_image_preview.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_action_dialog.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/styles.dart';

class DetailsTopButtons extends StatelessWidget {
  const DetailsTopButtons({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WishlistController>();
    return Positioned(
      top: 62.h,
      left: AppSize.s24.w,
      right: AppSize.s24.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(
            onTap: () => Get.back(),
            backgroundColor: const Color(0xFF0F0F0F).withValues(alpha: .16),
            child: SvgPicture.asset(AssetsData.iconArrowBackSvg),
          ),
          Row(
            children: [
              Obx(
                () => CircleButton(
                  /*onTap: () {
                    controller.toggleWishlist(productModel.id);
                  },*/
                  onTap: () async {
                    final added = await controller.toggleWishlist(
                      productModel.id,
                    );

                    if (added) {
                      Get.dialog(
                        AppActionDialog(
                          title: AppString.addedToWishlist,
                          message: AppString.addToWishlistDesc,
                          icon: Icons.bookmark_added,
                          product: productModel,
                        ),
                      );
                    } else {
                      Get.dialog(
                        AppActionDialog(
                          title: AppString.removedFromWishlist,
                          message: AppString.removeFromWishlistDesc,
                          icon: Icons.bookmark_remove,
                          product: productModel,
                        ),
                      );
                    }
                  },
                  backgroundColor: const Color(0xFF0F0F0F)
                      .withValues(alpha: .16),
                  child: Icon(
                    controller.isWishlisted(productModel.id)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: Colors.white,
                    size: 24.r,
                  ),
                ),
              ),
              SizedBox(width: AppSize.s8.w),
              CircleButton(
                onTap: () {
                  Get.dialog(
                    ProductImagePreview(images: productModel.images),
                    barrierColor: Colors.black.withValues(alpha: .55),
                  );
                },
                backgroundColor: const Color(0xFF0F0F0F).withValues(alpha: .16),
                child: SvgPicture.asset(
                  AssetsData.iconFullscreenSvg,
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
