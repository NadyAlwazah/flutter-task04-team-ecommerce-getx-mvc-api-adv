import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_string.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/wishlist/wishlist_screen/widgets/item_count_widget.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/wishlist/wishlist_screen/widgets/product_wishlist_card.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_app_bar.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_tabs.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppString.atelier,
        centerTitle: true,
        actions: [
          Image.asset(
            AssetsData.iconMenuSvg,
            color: AppColors.whiteText,
            width: AppSize.s16.w,
            height: AppSize.s16.h,
          ),
        ],
        isSerach: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      AppString.curationArchive,
                      style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                        color: AppColors.lightPrimaryText,
                      ),
                    ),
                    Text(
                      AppString.wishlist,
                      style: Styles.textStyle28W500BodoniModa.copyWith(
                        color: AppColors.whiteText,
                      ),
                    ),
                  ],
                ),
                itemCountWidget(count: 4),
              ],
            ),
            CustomFilterTabs(
              tabs: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.allItems,
                      style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                        color: AppColors.brownText,
                      ),
                    ),
                    Text(
                      '(4)',
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
                      AppString.outerwear,
                      style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                        color: AppColors.tabTextColor,
                      ),
                    ),
                    Text(
                      '(2)',
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
                      AppString.tops,
                      style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                        color: AppColors.tabTextColor,
                      ),
                    ),
                    Text(
                      '(1)',
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
                      AppString.shirts,
                      style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                        color: AppColors.tabTextColor,
                      ),
                    ),
                    Text(
                      '(1)',
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
            /*GridView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSize.s12.h,
                crossAxisSpacing: AppSize.s12.w,
                childAspectRatio: 169 / 346,
              ),
              itemBuilder: (index) => ProductWishlistCard(product: product),
            ),*/
          ],
        ),
      ),
    );
  }
}
