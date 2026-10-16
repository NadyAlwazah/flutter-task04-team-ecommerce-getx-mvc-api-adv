import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/wishlist_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/status_class.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/wishlist/wishlist_screen/widgets/item_count_widget.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/wishlist/wishlist_screen/widgets/product_wishlist_card.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/wishlist/wishlist_screen/widgets/wishlist_banner.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_loader.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_tabs.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WishlistController>();
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.s20.w,
          vertical: AppSize.s12.h,
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: Center(
              child: SizedBox(
                width: AppSize.s16.w,
                height: AppSize.s16.h,
                child: SvgPicture.asset(
                  AssetsData.iconSearchSvg,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            title: Text(
              'ATELIER',
              style: Styles.textStyle20W500BodoniModa.copyWith(
                color: AppColors.whiteText,
              ),
            ),
            shape: Border(
              bottom: BorderSide(
                color: AppColors.appBarBorder,
                width: AppSize.s1.w,
              ),
            ),
            backgroundColor: AppColors.backgroundColor,
            centerTitle: true,
            actions: [
              SvgPicture.asset(
                AssetsData.iconMenuSvg,
                width: AppSize.s16.w,
                height: AppSize.s16.h,
              ),
            ],
          ),

          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: AppSize.s30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'CURATION ARCHIVE',
                          style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                            color: AppColors.lightPrimaryText,
                          ),
                        ),
                        Text(
                          'Wishlist',
                          style: Styles.textStyle28W500BodoniModa.copyWith(
                            color: AppColors.whiteText,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    itemCountWidget(count: controller.wishlistIds.length),
                  ],
                ),
                SizedBox(height: AppSize.s24.h),
                CustomFilterTabs(
                  tabs: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ALL ITEMS',
                          style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                            color: AppColors.brownText,
                          ),
                        ),
                        Text(
                          ' (${controller.wishlistIds.length.toString()})',
                          style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                            color: AppColors.brownText,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'OUTERWEAR',
                          style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                            color: AppColors.tabTextColor,
                          ),
                        ),
                        Text(
                          ' (2)',
                          style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                            color: AppColors.tabTextColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOPS',
                          style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                            color: AppColors.tabTextColor,
                          ),
                        ),
                        Text(
                          ' (1)',
                          style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                            color: AppColors.tabTextColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SHIRTS',
                          style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                            color: AppColors.tabTextColor,
                          ),
                        ),
                        Text(
                          ' (1)',
                          style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                            color: AppColors.tabTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                  selectedTab: 0,
                  onSelect: () {},
                ),
                SizedBox(height: AppSize.s24.h),
                controller.status == StatusClass.isLoading
                    ? AppLoader()
                    : controller.status == StatusClass.noData
                    ? Center(
                        child: Text(
                          'No Items available \n \n',
                          style: Styles.textStyle14W500ClashDisplay.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    : GridView.builder(
                        itemCount: controller.wishlistItems.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppSize.s12.h,
                          crossAxisSpacing: AppSize.s12.w,
                          childAspectRatio: 169 / 346,
                        ),
                        itemBuilder: (context, index) => ProductWishlistCard(
                          product: controller.wishlistItems[index],
                        ),
                      ),
                SafeArea(child: wishlistBanner()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
