import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          ? Image.asset(AssetsData.iconSearchSvg, color: AppColors.whiteText)
          : Image.asset(
              AssetsData.iconArrowBackSvg,
              color: AppColors.whiteText,
            ),
      title: Text(title.toUpperCase(), style: Styles.textStyle20W500BodoniModa),
      centerTitle: centerTitle,
      actions: actions,
      shape: Border(
        bottom: BorderSide(color: AppColors.appBarBorder, width: AppSize.s1.w),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppSize.s65.h);
}
