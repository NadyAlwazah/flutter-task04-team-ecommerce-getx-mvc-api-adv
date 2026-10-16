import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class EditeTextFields extends StatelessWidget {
  const EditeTextFields({super.key, required this.hintText, required this.type, required this.label, required this.badgeText, required this.isEmail, required this.suffixIcon, required this.icon, required this.controller, this.validator,  });
final String hintText;
final TextInputType type;
final String label;
final String badgeText;
final bool isEmail;
final bool suffixIcon;
final String icon;
final String? Function(String?)? validator;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
           Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style:Styles.textStyle12W500PlusJakartaSans.copyWith(color:AppColors.secondTextColor,height: 1.3)
            ),
         isEmail?   
            Row(
              children: [
                const Icon(
                  Icons.verified,
                  size: 14,
                  color:AppColors.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  badgeText,
                  style:Styles.textStyle11W400PlusJakartaSans.copyWith(color:AppColors.primary,height: 1.5)
                ),
              ],
            ):const SizedBox(),
          ],
        ),  
        const SizedBox(height:AppSize.s6,),  
      TextFormField(
        validator: validator,
        style:Styles.textStyle15W400PlusJakartaSans.copyWith(color: AppColors.secondTextColor),
        controller: controller,
          keyboardType:type,  
          decoration: InputDecoration(
            hintText:hintText,
            hintStyle:Styles.textStyle11W400PlusJakartaSans.copyWith(color: AppColors.secondTextColor),
            suffixIcon:suffixIcon?Padding(padding: EdgeInsets.all(16),child: SvgPicture.asset(icon,)):const SizedBox(),
          filled: true,
            fillColor:AppColors.backgroundItem.withOpacity(0.3), 
            contentPadding: const  EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color:AppColors.backgroundNumberColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color:AppColors.primary, width: 1.5), // لون برتقالي هادئ عند التركيز
            ),
          ),
          
          onChanged: (value) {
            
          },
    )]);
  }
}