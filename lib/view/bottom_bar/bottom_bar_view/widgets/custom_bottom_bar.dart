import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_view/widgets/bottom_bar_item.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_view/widgets/bottom_bar_items.dart';
import 'package:get/get.dart';

class CustomBottomBar extends GetView<BottomBarController> {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Container(
        height: 66.h,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        decoration: BoxDecoration(
          color: const Color(0xFF141414).withValues(alpha: .9),
          borderRadius: BorderRadius.circular(34.r),
          border: Border.all(color: const Color(0xFF2D2D2D)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .4),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Obx(
          () => Row(
            children: List.generate(
              BottomBarItems.items.length,
              (index) => Expanded(
                child: BottomBarItem(
                  item: BottomBarItems.items[index],
                  selected: controller.currentIndex.value == index,
                  onTap: () => controller.changeTab(index),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
