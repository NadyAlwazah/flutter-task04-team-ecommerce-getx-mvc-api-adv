
import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class MemberOrders extends StatelessWidget {
    const MemberOrders({
    super.key, required this.number, required this.text,required this.isOrder
  });
final String number;
final String text;
final bool isOrder;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,spacing:4,
      children: [Text(number,style:Styles.textStyle20W500BodoniModa.copyWith(color:isOrder?AppColors.vipMemberColor:AppColors.atelierTextColor,height: 1.4),),
    Text(text,style: Styles.textStyle10W600PlusJakartaSans.copyWith(color:AppColors.secondTextColor),)],);
  }
}