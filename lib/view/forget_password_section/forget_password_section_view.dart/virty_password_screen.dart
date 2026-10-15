import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/forget_password_section/forget_password_section_view.dart/widgets/numer.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';

class VirtyCodeScreen extends StatelessWidget {
  VirtyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            CircleButton(child: SvgPicture.asset(AssetsData.iconArrowBackSvg)),
            SizedBox(height: 30.h),
            Center(
              child: Text(
                'Verify Code',
                style: Styles.textStyle24W500ClashDisplay.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Please enter the code we just sent to email\n',
                    style: Styles.textStyle14W500ClashDisplay.copyWith(
                      color: AppColors.secondText,
                    ),
                  ),
                  TextSpan(
                    text: 'example@gamil.com',
                    style: Styles.textStyle14W500ClashDisplay.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              children: [
                NumberCapsule(number: '2', isActive: true),
                SizedBox(width: 12.w),
                NumberCapsule(number: '4', isActive: true),
                SizedBox(width: 12.w),
                NumberCapsule(number: '5'),
                SizedBox(width: 12.w),
                NumberCapsule(number: '0'),
              ],
            ),
            SizedBox(height: 38.h),
            CustomButton(text: "Verify", onPressed: () {}, radius: 150),
            SizedBox(height: 38.h),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Send code again',
                      style: Styles.textStyle14W500ClashDisplay.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: ' 00 : 34',
                      style: Styles.textStyle14W500ClashDisplay.copyWith(
                        color: AppColors.secondText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
