import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/orbit_circle.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -25.h,
            right: -150.w,
            child: const OrbitCircle(diameter: 230, dotAngle: 2.618),
          ),
          Positioned(
            bottom: -21.h,
            left: -108.w,
            child: const OrbitCircle(diameter: 196, dotAngle: -0.593),
          ),
          Center(child: SvgPicture.asset(AssetsData.iconLogoSvg, width: 174.w)),
        ],
      ),
    );
  }
}
