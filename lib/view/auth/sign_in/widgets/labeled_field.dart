import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class LabeledField extends StatelessWidget {
  const LabeledField({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          child: Text(
            label,
            style: Styles.textStyle16W500ClashDisplay.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        child,
      ],
    );
  }
}
