import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/products_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/status_class.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_loader.dart';
import 'package:get/get.dart';

import 'product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (controller) {
        if (controller.status == StatusClass.isLoading) {
          return const SliverFillRemaining(child: Center(child: AppLoader()));
        }

        if (controller.status == StatusClass.noInternet) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('No Internet Connection')),
          );
        }

        if (controller.status == StatusClass.noData) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('No Data Available')),
          );
        }

        if (controller.status == StatusClass.serverError) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('Server Error')),
          );
        }
        if (controller.products.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('No products in this category')),
          );
        }
        return SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Transform.translate(
              offset: Offset(0, index.isOdd ? 29.h : 0),
              child: ProductCard(
                productModel: controller.products[index],
                isFavorite: false,
              ),
            );
          }, childCount: controller.products.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 28.h,
            childAspectRatio: 155 / 230,
          ),
        );
      },
    );
  }
}
