
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_controller/favorite_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_widget/favorite_header.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_widget/favorite_filter_list.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_widget/favorite_empty_state.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_widget/favorite_product_list.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static const Color backgroundColor = Color(0xFF141414);
  static const Color textColor = Color(0xFFE5E2E1);
  static const Color mutedColor = Color(0xFF92837A);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (controller) {
        final favoriteItems = controller.favoriteProducts;
        final visibleItems = controller.getFilteredProducts();

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: textColor,
                size: 18.sp,
              ),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Favorites',
                  style: Styles.textStyle24W400BodoniModa.copyWith(
                    color: textColor,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF292421),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '${favoriteItems.length}',
                    style: TextStyle(
                      color: const Color(0xFFDCC2B0),
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AssetsData.search,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AssetsData.IconButtonBag,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              SizedBox(width: 8.w),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FavoriteHeader(),
                  SizedBox(height: 14.h),
                  FavoriteFilterList(controller: controller),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: visibleItems.isEmpty
                        ? FavoriteEmptyState(
                            hasFavorites: favoriteItems.isNotEmpty,
                          )
                        : FavoriteProductList(
                            products: visibleItems,
                            controller: controller,
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
