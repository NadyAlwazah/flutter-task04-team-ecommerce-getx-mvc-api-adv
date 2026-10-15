import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/widgets/build_sized_box.dart';

 
class SizingScreen extends StatelessWidget {
  const SizingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
             padding: const EdgeInsets.all(18),
             decoration: BoxDecoration(
               color:AppColors.backgroundItem,
               borderRadius: BorderRadius.circular(24.0),
               border: Border.all(
                 color: Colors.white.withOpacity(0.05),
                 width: 1,
               ),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:   [
                     Text(
                       'Sizing & Silhouette',
                       style:Styles.textStyle20W500BodoniModa.copyWith(color: AppColors.atelierTextColor,height:1.4)
                     ),
                     Text(
                       '02 /\nTAILORING',
                       style:Styles.textStyle10W600PlusJakartaSans.copyWith(color:AppColors.secondTextColor) 
                     ),
                   ],
                 ),
                 const SizedBox(height: 8),
           
                 Text(
                   'Custom bespoke fitting for Atelier\nHaute Couture releases',
                   style:Styles.textStyle13W400PlusJakartaSans.copyWith(color: AppColors.secondTextColor,
                   height: 1.5,letterSpacing: 0.13)
                 ),
                   const SizedBox(height:AppSize.s20),
                 Text(
                   'Preferred Aesthetic Department',
                   style:Styles.textStyle12W500PlusJakartaSans.copyWith(color: AppColors.secondTextColor)
                 ),
                 const SizedBox(height: 12),
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical:8),
                   decoration: BoxDecoration(
                     color: AppColors.backgroundContainerColor,
                     borderRadius: BorderRadius.circular(20.0),
                     border: Border.all(
                       color: AppColors.primary
                     ),
                   ),
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Container(
                         width: 8,
                         height: 8,
                         decoration: const BoxDecoration(
                           color:AppColors.primary,
                           shape: BoxShape.circle,
                         ),
                       ),
                       const SizedBox(width: 8),
                         Text(
                         "Women's Haute Couture",
                         style:Styles.textStyle12W500PlusJakartaSans.copyWith(color: AppColors.primary,letterSpacing:0.96)
                       ),
                     ],
                   ),
                 ),
                 const SizedBox(height: 12),
                Row(
                   children: [
                     Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(border: Border.all(color:Colors.white.withOpacity(0.1)),
        color:AppColors.backgroundItem,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
         'Unisex Archetype',
        style:Styles.textStyle12W500PlusJakartaSans.copyWith(color:AppColors.secondTextColor)
      ),
    ),
                      
const SizedBox(width: AppSize.s10),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(border: Border.all(color:Colors.white.withOpacity(0.1)),
        color:AppColors.backgroundItem,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
         "Men's Archive",
        style:Styles.textStyle12W500PlusJakartaSans.copyWith(color:AppColors.secondTextColor)
      ),
    ),],),
  const SizedBox(height: AppSize.s24),
                 const Row(
                   children: [
                     Expanded(
                       child: BuildSizedBox(
                         category: 'TOP /\nJACKET',
                         size: 'S / 36',
                       ),
                     ),
                     SizedBox(width:10),
                     Expanded(
                       child: BuildSizedBox(
                         category: 'TROUSER /\nSKIRT',
                         size: '38 FR',
                       ),
                     ),
                     SizedBox(width:10),
                     Expanded(
                       child: BuildSizedBox(
                         category: 'FOOTWEAR',
                         size: 'EU 39',
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           );
  }

 

}