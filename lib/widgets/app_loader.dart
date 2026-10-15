import 'package:flutter/cupertino.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';

class AppLoader extends StatelessWidget {
  final double radius;
  final Color? color;

  const AppLoader({super.key, this.radius = 15, this.color});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: radius,
      color: color ?? AppColors.primary,
    );
  }
}
