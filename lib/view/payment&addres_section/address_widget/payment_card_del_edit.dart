import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/payment_card_model.dart';

class PaymentCardControls extends StatelessWidget {
  final PaymentCardModel card;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PaymentCardControls({
    super.key,
    required this.card,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final number = card.cardNumber.replaceAll(' ', '');
    final lastFour = number.length >= 4
        ? number.substring(number.length - 4)
        : number;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff211D1A),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xff40342D),
        ),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AssetsData.paymentCard,
            width: 30.w,
            height: 30.h,
          ),
          SizedBox(width: 12.w),

          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '•••• •••• ••••\n $lastFour',
                  maxLines: 2,
                  style: Styles.textStyle12W500PlusJakartaSans.copyWith(
                    color: const Color(0xffE5E2E1),
                  ),
                ),
                SizedBox(height: 6.h),
               Text('EXPIRE ${card.expireDate}',
                  
                  style: Styles.textStyle11W500PlusJakartaSans.copyWith(
                  color: AppColors.brown,fontWeight: FontWeight.w400,fontSize: 13.sp
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          Expanded(
           flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VISA',
                  style: Styles.textStyle12W500PlusJakartaSans.copyWith(fontSize: 10.sp,
                    color: AppColors.brown ,fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'PLATINUM',
                  style: Styles.textStyle10W600PlusJakartaSans.copyWith(fontSize: 10.sp,
                    color: AppColors.brown,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onEdit,
                tooltip: 'Edit',
                visualDensity: VisualDensity.compact,
                icon: Icon(
                  Icons.edit_outlined,
                  size: 20.sp,
                  color: AppColors.brown,
                ),
              ),
             
GestureDetector(
  onTap: onDelete,
  child: SvgPicture.asset(
    AssetsData.buttonDeleteAddress,
    width: 40.sp,
    height: 40.sp,
  ),
),

            ],
          ),
        ],
      ),
    );
  }
}