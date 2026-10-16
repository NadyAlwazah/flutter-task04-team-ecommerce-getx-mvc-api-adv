
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/payment_card_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';

class PaymentMainCard extends StatelessWidget {
  final PaymentCardModel card;
final bool isDefault;

  const PaymentMainCard({
    super.key, required this.card,  this.isDefault=false,
   
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
          SizedBox(height: 24.h),

          // Card header
          Row(
            children: [
              SvgPicture.asset(AssetsData.iconCardChip),
              SizedBox(width: AppSize.s12),
              SvgPicture.asset(AssetsData.contactLess),
              const Spacer(),

              if (isDefault)
  IntrinsicWidth(
    child: CustomButton(
      text: 'DEFAULT',
      heightButton: 20,
      radius: 20.r,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 2.h,
      ),
      backgroundColor: AppColors.primary,
      textColor: AppColors.backgroundColor,
      textStyle: Styles.textStyle10W600PlusJakartaSans.copyWith(
        color: AppColors.backgroundColor,
      ),
      onPressed: () {},
    ),
  ),
            ],
          ),

          SizedBox(height: AppSize.s36),

          // Card number
          Row(
            children: [
              _buildMaskedNumber(),
              _buildMaskedNumber(center: true),
              _buildMaskedNumber(center: true),
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
                      style: Styles.textStyle10W600PlusJakartaSans
                          .copyWith(
                        color: AppColors.brownLight,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      card.cardHolder.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle12W500PlusJakartaSans
                          .copyWith(
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
                      style: Styles.textStyle10W600PlusJakartaSans
                          .copyWith(
                        color: AppColors.brownLight,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      card.expireDate,
                      style: Styles.textStyle12W500PlusJakartaSans
                          .copyWith(
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

          // Actions for dynamic cards only
          
  ])
    );
  }

  Widget _buildMaskedNumber({bool center = false}) {
    return Expanded(
      child: Text(
        '••••',
        textAlign: center ? TextAlign.center : TextAlign.start,
        style: Styles.textStyle20W500BodoniModa.copyWith(
          letterSpacing: 3.5,
          fontSize: 30,
          color: const Color(0xffE5E2E1),
        ),
      ),
    );
  }
}
