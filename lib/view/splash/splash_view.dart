import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.backgroundColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Project Initialized Successfully',
              style: Styles.textStyle10W600PlusJakartaSans.copyWith(
                fontSize: 18,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
