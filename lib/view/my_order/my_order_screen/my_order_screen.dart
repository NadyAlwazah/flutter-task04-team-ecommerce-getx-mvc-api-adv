import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/models/fake_data.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/widgets/active_past_orders_widget.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/widgets/current_shipment_widget.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/widgets/past_order_card.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/widgets/past_order_header.dart';
import 'package:get/get.dart';
 
 

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});
   
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.myOrderBackGroundColor,
      appBar: AppBar(leading:InkWell(onTap:(){Get.back();},child: Icon(Icons.arrow_back,color: Colors.white,)),backgroundColor: AppColors.myOrderBackGroundColor,
      title: Text('My Orders',style:Styles.textStyle24W500BodoniModa,),centerTitle:true,
    actions: [Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(AssetsData.contactUS),
    )],  ),
   body:  SingleChildScrollView(
    child: Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    child: Column(
      children: [
         ActivePastOrdersWidget(),
       const SizedBox(height: AppSize.s24,),
      const  CurrentShipmentWidget(),
       const SizedBox(height:AppSize.s24,),
       const PastOrderHeader(),
       const SizedBox(height: AppSize.s8,),
        
       const SizedBox(height: AppSize.s8),
       ListView.separated(
        
         itemCount:2,
         shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
         
           separatorBuilder: (BuildContext context, int index) {return SizedBox(height:AppSize.s8 ); }, 
           itemBuilder: (BuildContext context, int index) { 
            final order = OrdersFakeData.pastOrders[index];
            return  PastOrderCard(order:order,); },
       )
        ],
    ),),

   ), );
  }
}