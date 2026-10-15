import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<Widget> actions;
  final bool isSerach;

  const CustomAppBar({
    required this.title,
    this.centerTitle = true,
    required this.actions,
    this.isSerach = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isSerach
          ? Center(
              child: SizedBox(
                width: AppSize.s16.w,
                height: AppSize.s16.h,
                child: SvgPicture.asset(
                  AssetsData.iconSearchSvg,
                  fit: BoxFit.contain,
                ),
              ),
            )
          : SvgPicture.asset(AssetsData.iconArrowBackSvg, fit: BoxFit.contain),
      title: Text(
        title.toUpperCase(),
        style: Styles.textStyle20W500BodoniModa.copyWith(
          color: AppColors.whiteText,
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
      shape: Border(
        bottom: BorderSide(color: AppColors.appBarBorder, width: AppSize.s1.w),
      ),
      backgroundColor: AppColors.backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSize.s65.h);
}
