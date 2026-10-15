
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/controller/profile_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/profile_screens/widget/divider_line.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/profile_screens/widget/member_orders_wishist_number.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class UserOrdersWishless extends StatelessWidget {
  const UserOrdersWishless({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<ProfileController>();
    return Container( 
             height: 90.h,width: 350.w,
            decoration: BoxDecoration(
              color:AppColors.backgroundItem, 
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color:AppColors.vipBorderColor, 
                width: 1,
              ),
            ),
            child:  Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MemberOrders(number:controller.userFakeData.user.ordersCount, text: 'ORDERS', isOrder:true,),
                const DividerLine(),
                MemberOrders(number:controller.userFakeData.user.wishlistCount, text: 'WISHLIST', isOrder: false,),
                const DividerLine(),
                 MemberOrders(number:controller.userFakeData.user.addressesCount, text: 'ADDRESSES', isOrder: false,),],
            ),);
  }
}