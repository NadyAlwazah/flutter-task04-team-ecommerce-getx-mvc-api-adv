import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/models/fake_data.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/widgets/order_details.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/widgets/order_tracking.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';

class CurrentShipmentWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final order = OrdersFakeData.activeOrders.first;
    return Column(
      children: [Row(
        children: [
        Text('CURRENT SHIPMENT',style: Styles.textStyle10W600PlusJakartaSans.copyWith(color: AppColors.goldTextColor),),
        const Spacer(flex: 2,),
        Container(width:8.w,height: 8.h,
        decoration: BoxDecoration(color: AppColors.darkGoldColor,borderRadius: BorderRadius.circular(100)),),
        const SizedBox(width:AppSize.s4,),
        Expanded(child:Text('On Schedule',style: Styles.textStyle12W500PlusJakartaSans.copyWith(color: AppColors.goldTextColor),))
      ],),
      const SizedBox(height: AppSize.s8,),
        Container(
          width: double.infinity,
           
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.containerBoarderColor,width: 1,),
            borderRadius: BorderRadius.circular(16),color:AppColors.backgroundItem ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16,vertical: AppSize.s16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Expanded(flex:2,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(order.id,style: Styles.textStyle14W600PlusJakartaSans.copyWith(color: Colors.white),),
                Text('${order.orderDate}• ${order.quantity} items',maxLines: 1,textAlign: TextAlign.start,
                style: Styles.textStyle13W400PlusJakartaSans.copyWith(color: AppColors.secondTextColor),),
               ],),
              ),
              const SizedBox(width:AppSize.s32 ,),
              Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [Text('\$${order.totalPrice}',style: Styles.textStyle20W500BodoniModa.copyWith(height: 1.4,fontWeight: FontWeight.w700,color:AppColors.priceColor),),Container(height: 21,width: 62,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(999),
              color: AppColors.prePaidColor,border: Border.all(color: AppColors.containerBoarderColor,width: 1)),
              child: Center(child: Text('PREPAID',style: Styles.textStyle13W400PlusJakartaSans.copyWith(fontSize: 10,color: AppColors.goldTextColor),)),)],)],),
              const SizedBox(height: AppSize.s4,),
           const Divider(color: AppColors.containerBoarderColor,thickness: 1,),
           const SizedBox(height: AppSize.s20,),
              const OrderDetails(),
              const SizedBox(height: AppSize.s20),
              const OrderTracking(),
              const SizedBox(height: AppSize.s16,),
                CustomButton(onPressed: () {},text:'Track Package',radius: 999,heightButton: 58.h,withSide:true,
                textStyle:Styles.textStyle10W600PlusJakartaSans.copyWith(fontSize: 12,color: Colors.white),
             icon :SvgPicture.asset(AssetsData.location),iconTextSpacing:8.w,),
             const SizedBox(height: AppSize.s8,),
                CustomButton(text:'View Order Details',textStyle:Styles.textStyle12W500PlusJakartaSans.copyWith(color: Colors.white),
                radius: 999,withSide: true,heightButton:58.h,borderColor:AppColors.buttonBoarderColor ,),
             
             ],),
          ),
        ),
   ],
    );
  }
}