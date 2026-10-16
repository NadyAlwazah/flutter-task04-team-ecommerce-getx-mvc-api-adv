
import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class DividerOfTime extends StatelessWidget {
  const DividerOfTime({
    super.key,
    required this.day,
  });

  final String day;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          day,
          style: Styles.textStyle10W700NimbusSans,
        ),

        SizedBox(width: AppSize.s7),

        Expanded(
          child: Container(
            height: 1,
            color: Color(0xFF2D2D2D).withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
