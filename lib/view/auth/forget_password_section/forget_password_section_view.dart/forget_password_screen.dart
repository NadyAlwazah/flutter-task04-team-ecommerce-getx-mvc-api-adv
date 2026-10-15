import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/create_acount_section/create_acount_section_view/widgets/divider.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_text_field.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 29.h),
            CircleButton(child: SvgPicture.asset(AssetsData.iconArrowBackSvg)),
            SizedBox(height: 30.h),
            Center(
              child: Text(
                'Forgot password',
                style: Styles.textStyle24W500ClashDisplay.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                "Please enter your email address to\n     receive a verification code",
                style: Styles.textStyle14W500ClashDisplay.copyWith(
                  color: AppColors.secondText,
                  wordSpacing: 1,
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Text(
              "Email",
              style: Styles.textStyle16W500ClashDisplay.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(height: AppSize.s8.h),
            AppTextField(
              controller: emailcontroller,
              hintText: "example@gamil.com",
            ),
            SizedBox(height: 38.h),
            CustomButton(
              text: "Verify",
              onPressed: () {
                Get.toNamed(AppRoutes.kVerifyCode);
              },
              radius: 150,
            ),
            Spacer(),
            DividerWidget(),
          ],
        ),
      ),
    );
  }
}
