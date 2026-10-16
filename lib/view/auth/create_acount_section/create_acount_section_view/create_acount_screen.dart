import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_size.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/helpful_function/validators.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/create_acount_section/create_acount_section_controller/create_acount_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_text_field.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/create_acount_section/create_acount_section_view/widgets/divider.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/circle_button.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';
import 'package:get/get.dart';

class CreateAcount extends StatelessWidget {
  CreateAcount({super.key});
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RegisterController controller = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                Image.asset(AssetsData.imageCreateAcount),
                SizedBox(height: AppSize.s20.h),
                Center(
                  child: Text(
                    "Create Account",
                    style: Styles.textStyle24W500ClashDisplay.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s20.h),
                Text(
                  "Name",
                  style: Styles.textStyle16W500ClashDisplay.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                AppTextField(
                  controller: nameController,
                  hintText: "John Doe",
                  validator: (value) {
                    return Validators.nameValidator(value);
                  },
                ),
                SizedBox(height: AppSize.s20.h),
                Text(
                  "Email",
                  style: Styles.textStyle16W500ClashDisplay.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                AppTextField(
                  controller: emailController,
                  hintText: "example@gamil.com",
                  validator: (value) {
                    return Validators.email(value);
                  },
                ),
                SizedBox(height: AppSize.s20.h),
                Text(
                  "Password",
                  style: Styles.textStyle16W500ClashDisplay.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: AppSize.s8.h),
                AppTextField(
                  controller: passwordController,
                  hintText: "********",

                  validator: (value) {
                    return Validators.password(value);
                  },
                ),
                SizedBox(height: 28.h),
                CustomButton(
                  text: "Sign Up",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.register(
                        name: nameController.text.trim(),
                        email: emailController.text.toString(),
                        password: passwordController.text.toString(),
                        avatar:
                            "https://api.lorem.space/image/face?w=640&h=480",
                      );
                    }
                  },
                  radius: 150,
                ),
                SizedBox(height: 43.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleButton(
                      child: SvgPicture.asset(AssetsData.iconappleSvg),
                    ),
                    CircleButton(
                      child: SvgPicture.asset(AssetsData.icongoogleSvg),
                    ),
                    CircleButton(
                      child: SvgPicture.asset(AssetsData.iconfacebookSvg),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                //TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: Styles.textStyle16W500ClashDisplay.copyWith(
                        color: Colors.white,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Sign in",
                            style: Styles.textStyle16W500ClashDisplay.copyWith(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 31.h),
                DividerWidget(),
                //diveder
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
