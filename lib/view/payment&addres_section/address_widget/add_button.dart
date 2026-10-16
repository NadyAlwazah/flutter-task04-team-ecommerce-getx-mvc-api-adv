import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class AddNewButton extends StatelessWidget {
  AddNewButton({
    super.key,
    required this.text,
    this.onTap,
    required this.iconButtonAddCard,
    this.width,
  });

  final String text;
  final String iconButtonAddCard;
  final VoidCallback? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 49.h,
        padding: const EdgeInsets.symmetric(
          //horizontal: 20,
          //vertical: 16,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff201F1F),
          borderRadius: BorderRadius.circular(9999),
          border: Border.all(color: const Color(0xff2A2A2A)),
        ),
        child: Align(
          alignment: AlignmentGeometry.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(iconButtonAddCard),

              const SizedBox(width: 11),

              Flexible(
                child: Text(
                  text,
                  style: Styles.textStyle12W500PlusJakartaSans.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
