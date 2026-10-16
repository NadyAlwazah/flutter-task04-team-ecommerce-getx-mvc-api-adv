import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/models/fake_data.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final order = OrdersFakeData.activeOrders.first;
    return Row(
      children: [
        Stack(
          children: [
            const SizedBox(width: AppSize.s108),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                border: Border.all(
                  color: AppColors.backgroundItem,
                  width: AppSize.s2,
                ),
              ),
              width: 56.w,
              height: 70.h,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Image.network(order.productImage, fit: BoxFit.cover),
              ),
            ),

            Positioned(
              left: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  border: Border.all(color: AppColors.backgroundItem, width: 2),
                ),
                width: 56.w,
                height: 70.h,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Image.network(order.productImage, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.productName,
                style: Styles.textStyle16W500PlusJakartaSans.copyWith(
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                order.productDetails,
                style: Styles.textStyle13W400PlusJakartaSans.copyWith(
                  color: AppColors.secondTextColor,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
