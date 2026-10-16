import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class AccountConciergeHeader extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('ACCOUNT CONCIERGE',style:Styles.textStyle10W600PlusJakartaSans.copyWith(height: 1.4,color: AppColors.secondTextColor),),
        SizedBox(width:140.w,),
        Text('Atelier Privé',style: Styles.textStyle11W500PlusJakartaSans.copyWith(color: AppColors.vipMemberColor),)
      ],
    );
  }
}
