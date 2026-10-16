import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class StepItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final bool isCurrent;

    const StepItem({
    required this.title,
    required this.isCompleted,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isCompleted || isCurrent ?AppColors.primary :AppColors.myOrderBackGroundColor;
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            border: Border.all(color:isCompleted||isCurrent ?AppColors.primary: AppColors.buttonBoarderColor,
            ),
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            isCompleted ? Icons.check : (isCurrent ? Icons.local_shipping : Icons.fiber_manual_record),
            color:isCompleted  || isCurrent?Colors.white: AppColors.buttonBoarderColor,
            size:15,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style:Styles.textStyle11W500PlusJakartaSans.copyWith(color:isCompleted||isCurrent?Colors.white:AppColors.textColor)
        ),
      ],
    );
  }
}