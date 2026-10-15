import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/product_image_preview.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';
import 'package:get/get.dart';

class DetailsTopButtons extends StatelessWidget {
  const DetailsTopButtons({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
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
              CircleButton(
                onTap: () {},
                backgroundColor: const Color(0xFF0F0F0F).withValues(alpha: .16),
                child: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 24.r,
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
