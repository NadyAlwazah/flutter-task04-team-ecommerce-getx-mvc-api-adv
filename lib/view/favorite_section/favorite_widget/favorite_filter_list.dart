
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_controller/favorite_controller.dart';

class FavoriteFilterList extends StatelessWidget {
  const FavoriteFilterList({
    super.key,
    required this.controller,
  });

  final FavoriteController controller;

  static const Color mutedColor = Color(0xFF92837A);
  static const Color orangeColor = Color(0xFFEF674A);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.filters.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final isSelected = controller.selectedFilter == index;
          final count = controller.getFilterCount(index);

          return GestureDetector(
            onTap: () => controller.changeFilter(index),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? orangeColor
                    : const Color(0xFF222222),
                borderRadius: BorderRadius.circular(20.r),
                border: isSelected
                    ? null
                    : Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
              ),
              child: Text(
                '${controller.filters[index]} ($count)',
                style: TextStyle(
                  color: isSelected ? Colors.white : mutedColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
