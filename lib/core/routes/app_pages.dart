import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/onboarding_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/splash_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/onboarding/onboarding_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/splash/splash_view.dart';
import 'package:get/get.dart';

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
  ];
}
