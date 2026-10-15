 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/models/fake_data.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/models/order_model.dart';

class PastOrderCard extends StatelessWidget {
  const PastOrderCard({super.key, required this.order});
  final OrderModel order;
@override
  Widget build(BuildContext context) {
   
    return Container(
      padding:  const EdgeInsets.all(AppSize.s16),
      decoration: BoxDecoration(
        color:AppColors.backgroundItem,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.containerBoarderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order number and status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.id,
                      style:Styles.textStyle12W700PlusJakartaSans.copyWith(color: Colors.white,)
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Completed ${order.completedDate}',
                      style:Styles.textStyle13W400PlusJakartaSans.copyWith(color:AppColors.secondTextColor,height: 1.3)
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color:AppColors.prePaidColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: AppColors.miniContainerBoarder,
                  ),
                ),
                child:   Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 8,
                      color:AppColors.goldTextColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      order.shipmentStatus,
                      style:Styles.textStyle13W400PlusJakartaSans.copyWith(fontSize: 11,color: AppColors.goldTextColor)
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // Product information
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                 order.productImage ,
                  width: 64.w,
                  height:72.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 78,
                      height: 78,
                      color:AppColors.backgroundNumberColor,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: AppColors.goldTextColor,
                        size: 32,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),

               Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:Styles.textStyle16W500PlusJakartaSans.copyWith(color: Colors.white,height: 1.5)
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${order.quantity}items • ${order.productDetails}',
                      style:Styles.textStyle13W400PlusJakartaSans.copyWith(color: AppColors.secondTextColor)
                    ),
                    const SizedBox(height: 7),
                    Text(
                      '\$${order.totalPrice}',
                      style: Styles.textStyle18W700BodoniModa.copyWith(color: AppColors.priceColor,height: 1.5)
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          // Divider
          const Divider(
            color: Color(0xFF353333),
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 10),

          // Bottom actions
          Row(
            children: [
              TextButton(
                onPressed: () {
                  // TODO: Open review screen
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor:AppColors.textColor,
                ),
                child:   Text(
                  'Leave Review',
                  style:Styles.textStyle12W500PlusJakartaSans.copyWith(color: AppColors.secondTextColor)
                ),
              ),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: () {
                  // TODO: Re-order products
                },
                icon: const Icon(
                  Icons.sync,
                  size: 19,
                ),
                label: Text(
                  'Re-order',
                  style: Styles.textStyle12W500PlusJakartaSans.copyWith(color: AppColors.priceColor)
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.priceColor,
                  side: const BorderSide(
                    color: AppColors.priceColor,
                    width: 1,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}