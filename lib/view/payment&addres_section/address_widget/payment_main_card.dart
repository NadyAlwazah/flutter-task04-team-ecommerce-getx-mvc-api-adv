
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/payment_card_model.dart';



class PaymentMainCard extends StatelessWidget {
  final PaymentCardModel card;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSetDefault;

  const PaymentMainCard({
    super.key,
    required this.card,
    required this.onEdit,
    required this.onDelete,
    required this.onSetDefault,
  });

  @override
  Widget build(BuildContext context) {
    final String number = card.cardNumber.replaceAll(' ', '');
    final String lastFour = number.length >= 4
        ? number.substring(number.length - 4)
        : number;

    return Container(
      width: double.infinity,
     padding: EdgeInsets.symmetric(
  horizontal: 24.w,
  vertical: 24.h,
),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff2D231D),
            Color(0xff151515),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24,),
          // Card header
          Row(
            children: [
              SvgPicture.asset(
                AssetsData.iconCardChip,
              ),

              SizedBox(width: AppSize.s12),

              SvgPicture.asset(
                AssetsData.contactLess,
              ),

              const Spacer(),

              
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'DEFAULT',
                    style:
                        Styles.textStyle10W600PlusJakartaSans.copyWith(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                )
              
            ],
          ),

          SizedBox(height: AppSize.s36),

          // Card number
         Row(
  children: [
    Expanded(
      child: Text(
        '••••',
        style: Styles.textStyle20W500BodoniModa.copyWith(letterSpacing: 3.5,fontSize: 30,
          color: const Color(0xffE5E2E1),
        ),
      ),
    ),

    Expanded(
      child: Text(
        '••••',
        textAlign: TextAlign.center,
        style: Styles.textStyle20W500BodoniModa.copyWith(letterSpacing: 3.5,fontSize: 30,
          color: const Color(0xffE5E2E1),
        ),
      ),
    ),

    Expanded(
      child: Text(
        '••••',
        textAlign: TextAlign.center,
        style: Styles.textStyle20W500BodoniModa.copyWith(letterSpacing: 3.5,fontSize: 30,
          color: const Color(0xffE5E2E1),
        ),
      ),
    ),

    Expanded(
      child: Text(
        lastFour,
        textAlign: TextAlign.end,
        style: Styles.textStyle20W500BodoniModa.copyWith(
          color: const Color(0xffE5E2E1),
          letterSpacing: 2,
        ),
      ),
    ),
  ],
),
            
          

          SizedBox(height: AppSize.s24.h),

          // Card holder and expiry date
         Row(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CARD HOLDER',
            style:
                Styles.textStyle10W600PlusJakartaSans.copyWith(
              color: AppColors.brownLight,
            ),
          ),

          SizedBox(height: 6.h),

          Text(
            card.cardHolder.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                Styles.textStyle12W500PlusJakartaSans.copyWith(
              color: const Color(0xffE5E2E1),
            ),
          ),
        ],
      ),
    ),

    Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPIRES',
            style:
                Styles.textStyle10W600PlusJakartaSans.copyWith(
              color: AppColors.brownLight,
            ),
          ),

          SizedBox(height: 6.h),

          Text(
            card.expireDate,
            style:
                Styles.textStyle12W500PlusJakartaSans.copyWith(
              color: const Color(0xffE5E2E1),
            ),
          ),
        ],
      ),
    ),

    SvgPicture.asset(
      AssetsData.masterLogo,
      width: 42.w,
      height: 42.h,
      fit: BoxFit.contain,
    ),
  ],
),
          SizedBox(height: 20.h),

          
        ],
      ),
    );
  }
}











