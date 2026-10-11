import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/category_section.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/discover_banner.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/home_header.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/product_filter_list_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/products_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSize.s28.h,
        left: AppSize.s24.w,
        right: AppSize.s24.w,
      ),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeHeader()),

          SliverToBoxAdapter(child: SizedBox(height: AppSize.s32.h)),

          const SliverToBoxAdapter(child: DiscoverBanner()),

          SliverToBoxAdapter(child: SizedBox(height: 44.h)),

          const SliverToBoxAdapter(child: CategoriesSection()),

          SliverToBoxAdapter(child: SizedBox(height: AppSize.s28.h)),

          const SliverToBoxAdapter(child: ProductFilterListView()),

          SliverToBoxAdapter(child: SizedBox(height: AppSize.s24.h)),

          const ProductsGridView(),

          SliverToBoxAdapter(child: SizedBox(height: AppSize.s32.h)),
        ],
      ),
    );
  }
}
