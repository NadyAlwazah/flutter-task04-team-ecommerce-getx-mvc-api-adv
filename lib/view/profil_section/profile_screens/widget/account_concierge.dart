import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class AccountConcierge extends StatelessWidget {
  const AccountConcierge({super.key, required this.title, required this.subtitle, required this.icon, required this.onTap, required this.isLogOut});
final String title;
  final String subtitle;
  final String icon;
  final VoidCallback onTap;
  final bool isLogOut;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical:8),
        decoration: BoxDecoration(
          color:AppColors.backgroundItem, 
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color:isLogOut?AppColors.isLogOutBoarder:
            AppColors.vipBorderColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Row(
                children: [
                  
                  Container(
                    width: 44.w,
                    height:54.h,
                    decoration: BoxDecoration(
                      color:isLogOut?AppColors.isLogOutBoarder:AppColors.backgroundItemColor2
                      ,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        icon,colorFilter:ColorFilter.mode(isLogOut?AppColors.isLogOutTextColor:AppColors.vipMemberColor,BlendMode.srcIn) ,),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Styles.textStyle14W500PlusJakartaSans.copyWith(color: isLogOut?AppColors.isLogOutTextColor:
                          AppColors.atelierTextColor)
                        ),
                        const SizedBox(height: 3),
                        Text(
                          subtitle,
                          style:Styles.textStyle13W400PlusJakartaSans.copyWith(color:isLogOut?AppColors.isLogOutTextColor:
                          AppColors.secondTextColor)
                        ),
                      ],
                    ),
                  ),
                    InkWell(onTap:onTap,
                      child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color:isLogOut?AppColors.isLogOutTextColor:
                      AppColors.textColor,
                      size: 16,
                                        ),
                    ),
                ],
              ),
            ),
          )
 
      
      ;
  }
}