import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/models/fake_data.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/widgets/step_item.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/widgets/step_line.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    final order = OrdersFakeData.activeOrders.first;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.prePaidColor,
        borderRadius: BorderRadius.circular(48),
        border: Border.all(color: AppColors.containerBoarderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepItem(title: 'Placed', isCompleted: true, isCurrent: false),
              StepLine(isCompleted: true),
              StepItem(title: 'Packed', isCompleted: true, isCurrent: false),
              StepLine(isCompleted: true),
              StepItem(title: 'Shipped', isCompleted: false, isCurrent: true),
              StepLine(isCompleted: false),
              StepItem(
                title: 'Delivered',
                isCompleted: false,
                isCurrent: false,
              ),
            ],
          ),
          const SizedBox(height: AppSize.s16),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.miniContainerBoarder),
              color: AppColors.backgroundItem,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AssetsData.send),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '/${order.shipmentStatus} /${order.estimatedDelivery}',
                        style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                          fontSize: 13,
                          color: Colors.white,
                          letterSpacing: 0.96,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order.shipmentDescription,
                        style: Styles.textStyle13W400PlusJakartaSans.copyWith(
                          color: AppColors.secondTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 6,
                children: [
                  Text(
                    'CARRIER  ',
                    style: Styles.textStyle13W400PlusJakartaSans.copyWith(
                      fontSize: 10,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    order.carrier,
                    style: Styles.textStyle13W400PlusJakartaSans.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 6,
                children: [
                  Text(
                    'WAYBILL  ',
                    style: Styles.textStyle13W400PlusJakartaSans.copyWith(
                      fontSize: 10,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    order.waybill,
                    style: Styles.textStyle11W500PlusJakartaSans.copyWith(
                      color: AppColors.goldTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
