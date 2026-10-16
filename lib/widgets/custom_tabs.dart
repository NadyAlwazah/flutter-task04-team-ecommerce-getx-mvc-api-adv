import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';

class CustomFilterTabs extends StatelessWidget {
  final List<Widget> tabs;
  final int selectedTab;
  final VoidCallback onSelect;
  const CustomFilterTabs({
    required this.tabs,
    required this.selectedTab,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s48.h,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: tabs.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final isSelected = index == selectedTab;
          return GestureDetector(
            onTap: onSelect,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.s16.w,
                vertical: AppSize.s10.h,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.backgroundItem,
                borderRadius: BorderRadius.circular(AppSize.s9999.r),
                border: Border.all(
                  color: AppColors.white.withOpacity(0.7),
                  width: AppSize.s1.w,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.05),
                          blurRadius: AppSize.s2.r,
                          offset: Offset(AppSize.s0.w, AppSize.s1.h),
                        ),
                      ]
                    : [],
              ),
              child: tabs[index],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: AppSize.s8.w),
      ),
    );
  }
}
