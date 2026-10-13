import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_loader.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.onFavoriteTap,
    required this.productModel,
    required this.isFavorite,
  });
  final ProductModel productModel;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.w,
      height: 230.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: productModel.images.first,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: AppLoader()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error, color: Colors.white)),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: .7),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: AppSize.s12,
            right: AppSize.s14,
            child: GestureDetector(
              onTap: onFavoriteTap,
              child: Container(
                padding: const EdgeInsets.all(4.36),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  isFavorite
                      ? AssetsData.iconHeartFilledSvg
                      : AssetsData.iconHeartOutlineSvg,
                  width: 15.272727012634277.r,
                  height: 15.272727012634277.r,
                ),
              ),
            ),
          ),

          Positioned(
            left: AppSize.s14,
            right: AppSize.s14,
            bottom: AppSize.s14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14W500ClashDisplay.copyWith(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
                const SizedBox(height: AppSize.s4),
                Text(
                  '\$${productModel.price}',
                  style: Styles.textStyle18W600ClashDisplay.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: AppSize.s14,
            bottom: 15,
            child: InkWell(
              onTap: () =>
                  Get.toNamed(AppRoutes.kDetails, arguments: productModel),
              child: Container(
                width: 22.r,
                height: 22.r,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.north_east_rounded,
                  color: Colors.white,
                  size: AppSize.s14.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
