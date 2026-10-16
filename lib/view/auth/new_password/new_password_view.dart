import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/helpful_function/validators.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/new_password/bindings/new_password_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_text_field.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/labeled_field.dart';
import 'package:get/get.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: 110.h),
                Text(
                  'NEW PASSWORD',
                  style: Styles.textStyle24W500ClashDisplay.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Your new password must be different\n'
                  'from previously used password.',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle14W500ClashDisplay.copyWith(
                    color: AppColors.secondText,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 40.h),
                LabeledField(
                  label: 'Password',
                  child: Obx(
                    () => AppTextField(
                      controller: controller.passwordController,
                      hintText: '********',
                      obscureText: controller.isPasswordHidden.value,
                      validator: Validators.password,
                      suffixIcon: IconButton(
                        onPressed: controller.togglePasswordVisibility,
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                LabeledField(
                  label: 'Confirm Password',
                  child: Obx(
                    () => AppTextField(
                      controller: controller.confirmPasswordController,
                      hintText: '******',
                      obscureText: controller.isConfirmPasswordHidden.value,
                      validator: (value) => Validators.confirmPassword(
                        value,
                        controller.passwordController.text,
                      ),
                      suffixIcon: IconButton(
                        onPressed: controller.toggleConfirmPasswordVisibility,
                        icon: Icon(
                          controller.isConfirmPasswordHidden.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                CustomButton(
                  text: 'Reset Password',
                  heightButton: 60,
                  radius: 40.r,
                  textStyle: Styles.textStyle24W500ClashDisplay.copyWith(
                    color: Colors.white,
                  ),
                  onPressed: controller.onResetPassword,
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
