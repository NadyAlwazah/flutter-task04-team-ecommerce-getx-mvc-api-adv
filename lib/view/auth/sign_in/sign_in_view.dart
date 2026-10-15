import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/sign_in/controllers/sign_in_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/assets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/helpful_function/validators.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/sign_in/widgets/labeled_field.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/sign_in/widgets/social_login_row.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/custom_button.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_text_field.dart';
import 'package:get/get.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final linkStyle = Styles.textStyle14W500ClashDisplay.copyWith(
      color: AppColors.primary,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.primary,
    );

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28.r),
                        child: Image.asset(
                          AssetsData.imageSignInBannerPng,
                          width: double.infinity,
                          height: 160.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'SIGN IN',
                        style: Styles.textStyle20W600ClashDisplay.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      LabeledField(
                        label: 'Email',
                        child: AppTextField(
                          controller: controller.emailController,
                          hintText: 'example@gamil.com',
                          keyboardType: TextInputType.emailAddress,
                          validator: Validators.email,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      LabeledField(
                        label: 'Password',
                        child: Obx(
                          () => AppTextField(
                            controller: controller.passwordController,
                            hintText: '******',
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
                      SizedBox(height: 12.h),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: 12.w),
                          child: GestureDetector(
                            onTap: controller.goToForgotPassword,
                            child: Text('Forgot password?', style: linkStyle),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Obx(
                        () => CustomButton(
                          text: 'Sign In',
                          heightButton: 60,
                          radius: 40.r,
                          isLoading: controller.isLoading.value,
                          loadingColor: Colors.white,
                          textStyle: Styles.textStyle20W600ClashDisplay
                              .copyWith(color: Colors.white),
                          onPressed: controller.onSignIn,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      SocialLoginRow(
                        onApple: controller.onAppleTap,
                        onGoogle: controller.onGoogleTap,
                        onFacebook: controller.onFacebookTap,
                      ),
                      const Spacer(),
                      SizedBox(height: 24.h),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: Styles.textStyle14W500ClashDisplay.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: controller.goToSignUp,
                            child: Text('Sign Up', style: linkStyle),
                          ),
                        ],
                      ),
                      SizedBox(height: 28.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
