import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/models/product_filter_model.dart';

class ProductFilterListView extends StatefulWidget {
  const ProductFilterListView({super.key});

  @override
  State<ProductFilterListView> createState() => _ProductFilterListViewState();
}

class _ProductFilterListViewState extends State<ProductFilterListView> {
  final List<ProductFilterModel> productFilters = const [
    ProductFilterModel(title: 'ALL'),
    ProductFilterModel(title: 'NEWEST'),
    ProductFilterModel(title: 'SALE'),
    ProductFilterModel(title: 'POPULAR'),
  ];

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: productFilters.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSize.s12),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.s24.w,
                vertical: AppSize.s12.h,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : const Color(0xFF0F0F0F),
                borderRadius: BorderRadius.circular(40.r),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.15),
                  width: 1,
                ),
              ),
              child: Text(
                productFilters[index].title,
                style: Styles.textStyle16W500ClashDisplay.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
