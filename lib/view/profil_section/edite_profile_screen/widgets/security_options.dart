import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class SecurityOptions extends StatelessWidget {
  const SecurityOptions({super.key, required this.onTap, required this.icon, required this.title, required this.subtitle, required this.showIndicator});
final VoidCallback onTap;
final String icon;
final String title;
final String subtitle;
final bool showIndicator;
  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container( constraints: BoxConstraints(
    minHeight:80.h,
  ),
        padding: const EdgeInsets.symmetric(horizontal:20, vertical: 12),
        decoration: BoxDecoration(border: BoxBorder.all(color:AppColors.backgroundContainerColor,width: 1),
          color:AppColors.backgroundItem,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
          
           SvgPicture.asset(icon), 
            const SizedBox(width: 16),
            
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:Styles.textStyle14W600PlusJakartaSans.copyWith(color:AppColors.atelierTextColor,letterSpacing: 0.8)
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style:Styles.textStyle12W500PlusJakartaSans.copyWith(color: AppColors.secondTextColor,letterSpacing: 0.13)
                  ),
                ],
              ),
            ),  
            Row(
              children: [
                if (showIndicator) ...[
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color:AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
  