import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/create_acount_section/create_acount_section_controller/create_acount_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/create_acount_section/create_acount_section_view/create_acount_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/forget_password_section/forget_password_section_view.dart/forget_password_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/forget_password_section/forget_password_section_view.dart/virty_password_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/splash/splash_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage<dynamic>> getPages = [
    GetPage(name: AppRoutes.kSplash, page: () => const SplashView()),
    GetPage(
      name: AppRoutes.kSignup,
      page: () => CreateAcount(),
      binding: BindingsBuilder(
        () => Get.lazyPut<RegisterController>(
          () => RegisterController(Get.find<Crud>()),
        ),
      ),
    ),
    GetPage(name: AppRoutes.kVerifyCode, page: () => VirtyCodeScreen()),
    GetPage(
      name: AppRoutes.kForgotPassword,
      page: () => ForgetPasswordScreen(),
    ),
  ];
}
