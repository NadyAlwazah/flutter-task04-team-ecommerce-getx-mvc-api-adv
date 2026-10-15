import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/onboarding_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/splash_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/new_password/controllers/new_password_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/onboarding/onboarding_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/splash/splash_view.dart';
import 'package:get/get.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/sign_in_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/sign_in/sign_in_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/new_password/new_password_view.dart';

class AppPages {
  static final List<GetPage<dynamic>> getPages = [
    GetPage(
      name: AppRoutes.kSplash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.kOnBoarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.kSignin,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.kNewPassword,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
  ];
}
