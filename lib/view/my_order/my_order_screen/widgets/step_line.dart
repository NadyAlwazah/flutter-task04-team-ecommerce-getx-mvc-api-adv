import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';

class StepLine extends StatelessWidget {
  final bool isCompleted;

  const StepLine({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        // ignore: deprecated_member_use
        color: isCompleted ?AppColors.primary : Colors.grey.withOpacity(0.3),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
      ),
    );
  }
}