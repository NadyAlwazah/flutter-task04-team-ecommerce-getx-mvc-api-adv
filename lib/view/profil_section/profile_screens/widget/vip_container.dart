
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class VipContainer extends StatelessWidget {
  const VipContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: 115.w,height:30.h,
    decoration: BoxDecoration(color: AppColors.backgroundNumberColor,borderRadius: BorderRadius.circular(99),
    border: Border.all(color: AppColors.vipBorderColor.withOpacity(0.3),width: 1),
    boxShadow:[BoxShadow(color:Colors.white.withOpacity(0.05),
    spreadRadius:0,  
                  blurRadius:2,
                  offset:Offset(0,1) )]),
      child:Row(mainAxisAlignment: MainAxisAlignment.center,
      spacing:6,
       children: [SvgPicture.asset(AssetsData.isVip),Text('VIP MEMBER',style: Styles.textStyle10W600PlusJakartaSans.copyWith(color: AppColors.vipMemberColor),)],) ,
    );
  }
}