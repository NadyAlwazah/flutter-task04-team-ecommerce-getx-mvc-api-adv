import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/onboarding_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/onboarding/widgets/highlighted_heading.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/onboarding/widgets/onboarding_collage.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: FittedBox(fit: BoxFit.contain, child: OnboardingCollage()),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
              child: Column(
                children: [
                  const HighlightedHeading(),
                  SizedBox(height: 32.h),
                  CustomButton(
                    text: "Let's Get start",
                    heightButton: 58,
                    radius: 40.r,
                    iconOnRight: true,
                    iconTextSpacing: 14,
                    textStyle: Styles.textStyle24W500ClashDisplay.copyWith(
                      color: Colors.white,
                    ),
                    icon: const Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: controller.onGetStarted,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
