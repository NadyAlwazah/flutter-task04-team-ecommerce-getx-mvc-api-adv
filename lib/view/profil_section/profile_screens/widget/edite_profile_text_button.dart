
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/my_order_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/edite_profile_screen.dart';
import 'package:get/get.dart';

class EditeProfileTextButton extends StatelessWidget {
  const EditeProfileTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell
    (onTap:()=>Get.to(()=> const EditeProfileScreen()),
      child: Container(width: 129.w,height:38.h,
                     decoration: BoxDecoration(color: AppColors.backgroundItem,borderRadius: BorderRadius.circular(99),
                     border: Border.all(color: AppColors.vipBorderColor.withOpacity(0.3),width:1),
                     ),
      child:Row(mainAxisAlignment: MainAxisAlignment.center,
      spacing:6,
       children: [Text('Edit Profile',style: Styles.textStyle12W500PlusJakartaSans.copyWith(color:AppColors.atelierTextColor
       ),),
       SvgPicture.asset(AssetsData.filter)],) ,
                     ),
    );
  }
}
