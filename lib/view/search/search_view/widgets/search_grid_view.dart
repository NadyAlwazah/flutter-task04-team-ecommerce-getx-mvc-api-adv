import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/status_class.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/product_card.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/search/search_controller/product_search_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_loader.dart';
import 'package:get/get.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductSearchController>(
      builder: (controller) {
        if (controller.status == StatusClass.isLoading) {
          return const SliverToBoxAdapter(child: AppLoader());
        }

        if (controller.status == StatusClass.noInternet) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'No Internet Connection',
                style: Styles.textStyle14W600PlusJakartaSans.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          );
        }

        if (controller.status == StatusClass.serverError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Server Error',
                style: Styles.textStyle14W600PlusJakartaSans.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          );
        }

        if (controller.status == StatusClass.noData) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'No Products Found',
                style: Styles.textStyle14W600PlusJakartaSans.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          );
        }

        if (controller.status.type == 'anotherError') {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                controller.status.message ?? 'Unknown Error',
                style: Styles.textStyle14W600PlusJakartaSans.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          );
        }

        if (controller.status == StatusClass.success) {
          return SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 21.h),
                  child: Center(
                    child: Text(
                      '${controller.products.length} Items found for "${controller.query}"',
                      style: Styles.textStyle14W500PlusJakartaSans.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ProductCard(productModel: controller.products[index]);
                }, childCount: controller.products.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 28.h,
                  childAspectRatio: 155 / 230,
                ),
              ),
            ],
          );
        }

        return SliverToBoxAdapter(
          child: Center(
            child: Text(
              'Search for products',
              style: Styles.textStyle14W500PlusJakartaSans.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
