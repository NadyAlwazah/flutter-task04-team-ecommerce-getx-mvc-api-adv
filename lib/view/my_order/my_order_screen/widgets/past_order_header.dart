import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/past_order_screen.dart';
import 'package:get/get.dart';

class PastOrderHeader extends StatelessWidget {
  const PastOrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
return Row(
  children: [Text('Past Orders',style: Styles.textStyle20W500BodoniModa.copyWith(height: 1.5,color:Colors.white,fontWeight:FontWeight.w400),),
  const Spacer(),
  InkWell(onTap:() => Get.to(()=>const PastOrderScreen()),child: Text('See All',style:Styles.textStyle12W500PlusJakartaSans.copyWith(color: AppColors.goldTextColor),))],
) ;}
}