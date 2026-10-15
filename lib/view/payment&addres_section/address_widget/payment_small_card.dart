import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/payment_card_model.dart';

class PaymentSecondaryCard extends StatelessWidget {
  final PaymentCardModel card;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PaymentSecondaryCard({
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
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: const Color(0xff1A1A1A),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: const Color(0xff2C2C2C),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsData.iconCardChip,
                    width: 18.w,
                    height: 18.h,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              "••••",
                              style: Styles
                                  .textStyle12W500PlusJakartaSans
                                  .copyWith(
                                color: const Color(0xffE5E2E1),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              lastFour,
                              style: Styles
                                  .textStyle12W500PlusJakartaSans
                                  .copyWith(
                                color: const Color(0xffE5E2E1),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              card.cardHolder,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles
                                  .textStyle12W500PlusJakartaSans
                                  .copyWith(
                                color: const Color(0xffE5E2E1),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Expires ${card.expireDate}",
                          style: Styles
                              .textStyle10W600PlusJakartaSans
                              .copyWith(
                            color: AppColors.brownLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}