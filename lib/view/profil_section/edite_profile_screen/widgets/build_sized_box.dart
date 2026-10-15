
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
class BuildSizedBox extends StatelessWidget {
  const BuildSizedBox({super.key, required this.category, required this.size});
final String category;
final String size;
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 80.w,height:110.h,
      decoration: BoxDecoration(
       border: Border.all(color:Colors.white.withOpacity(0.1)),
        color:AppColors.backgroundItem,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style:Styles.textStyle10W600PlusJakartaSans.copyWith(color:AppColors.secondTextColor,letterSpacing:0.5,height: 1.5)
            ),
            const SizedBox(height: AppSize.s8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  size,
                  style:Styles.textStyle18W400BodoniModa.copyWith(color: AppColors.atelierTextColor,height: 1.5) 
                ),const SizedBox(width:16,),
                const Icon(
                  Icons.unfold_more,
                  size: 16,
                  color:AppColors.atelierTextColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }}
