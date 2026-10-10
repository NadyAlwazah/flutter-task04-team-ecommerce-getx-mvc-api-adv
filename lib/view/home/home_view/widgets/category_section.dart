import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/status_class.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/controllers/categories_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/home_view/widgets/category_item.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_loader.dart';
import 'package:get/get.dart';

class CategoriesSection extends GetView<CategoriesController> {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'CATEGORY',
              style: Styles.textStyle18W600ClashDisplay.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8.w),

            Image.asset(AssetsData.imageFirePng, width: 10.w, height: 14.h),
          ],
        ),
        SizedBox(height: 18.h),
        GetBuilder<CategoriesController>(
          builder: (controller) {
            if (controller.status == StatusClass.isLoading) {
              return const Center(child: AppLoader());
            }

            if (controller.status == StatusClass.noInternet ||
                controller.status == StatusClass.noData ||
                controller.status == StatusClass.serverError ||
                controller.status.type == "anotherError") {
              return Center(
                child: Text(
                  controller.status.message ?? "Something went wrong",
                ),
              );
            }
            if (controller.status == StatusClass.success) {
              return SizedBox(
                height: 106.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: AppSize.s16.w),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      category: controller.categories[index],
                      isSelected: controller.selectedIndex == index,
                      onTap: () => controller.changeCategory(index),
                    );
                  },
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
