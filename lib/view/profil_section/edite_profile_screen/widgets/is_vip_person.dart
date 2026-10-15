
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class IsVipAtelier extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: 148.w,height:28.h,
    decoration: BoxDecoration(color: AppColors.backgroundItem,borderRadius: BorderRadius.circular(99),
    border: Border.all(color: AppColors.backgroundNumberColor,width: 1),
    ),
      child:Row(mainAxisAlignment: MainAxisAlignment.center,
      spacing:6,
       children: [SvgPicture.asset(AssetsData.verification),Text('VIP PATRON ATELIER',style: Styles.textStyle10W600PlusJakartaSans.copyWith(color: AppColors.atelierTextColor),)],) ,
    );
  }
}