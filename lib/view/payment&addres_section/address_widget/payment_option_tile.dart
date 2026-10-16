import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_model/payment_action_model.dart';

class PaymentOptionTile extends StatelessWidget {
  final PaymentOption paymentOption;
  final ValueChanged<bool>? onToggleChanged;
  final VoidCallback? onActionPressed;

  const PaymentOptionTile({
    Key? key,
    required this.paymentOption,
    this.onToggleChanged,
    this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1B1B),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          // الأيقونة
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF2A2A2A),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(paymentOption.assetIconPath, width: 11,height: 17,),
            ),
          ),
          const SizedBox(width: 12),

          // النصوص والتفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      paymentOption.name,
                      style:Styles.textStyle10W600PlusJakartaSans.copyWith(color: Color(0xffE5E2E1)
                      ,fontSize: 12)
                    ),
                    if (paymentOption.tagLabel != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          paymentOption.tagLabel!,
                          style: Styles.textStyle10W600PlusJakartaSans.copyWith( color: AppColors.backgroundColor,)
                          
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  paymentOption.detailDescription,
                  style:Styles.textStyle13W400PlusJakartaSans.copyWith(color: AppColors.brown)
                  ,
                ),
              ],
            ),
          ),

          // أداة التحكم الجانبية
          if (paymentOption.actionType == PaymentActionType.switchToggle)
           Switch(
  value: paymentOption.isEnabled,
  activeColor: AppColors.white,
  activeTrackColor: AppColors.primary,
  inactiveThumbColor: AppColors.white,
  onChanged: onToggleChanged,
)
          else if (paymentOption.actionType == PaymentActionType.navigationLink)
            TextButton(
              onPressed: onActionPressed,
              child: Text(
                paymentOption.actionLabel ?? '',
                 style:Styles.textStyle13W400PlusJakartaSans.copyWith(color: AppColors.brown,  decoration: TextDecoration.underline,)
                
              ),
            ),
        ],
      ),
    );
  }
}