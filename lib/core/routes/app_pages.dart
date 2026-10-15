import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/create_acount_section/create_acount_section_controller/create_acount_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/create_acount_section/create_acount_section_view/create_acount_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/forget_password_section/forget_password_section_view.dart/forget_password_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/forget_password_section/forget_password_section_view.dart/virty_password_screen.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/onboarding_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/splash_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/new_password/controllers/new_password_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/onboarding/onboarding_view.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/bottom_bar_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/my_order_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/past_order_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/edite_profile_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_view/bottom_bar_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/details_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/search/search_controller/product_search_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/search/search_view/search_view.dart';

import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/splash/splash_view.dart';
import 'package:get/get.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/sign_in_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/sign_in/sign_in_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/new_password/new_password_view.dart';

class AppPages {
  static final List<GetPage<dynamic>> getPages = [
    GetPage(
      name: AppRoutes.kOrderHistoryAndTracking,
      page: () => const MyOrderScreen(),
    ),
    GetPage(
      name: AppRoutes.kEditProfile,
      page: () => const EditeProfileScreen(),
    ),
    GetPage(name: AppRoutes.kPastOrders, page: () => const PastOrderScreen()),

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
    GetPage(
      name: AppRoutes.kSplash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.kBottomBar,
      page: () => const BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: AppRoutes.kDetails,
      page: () => DetailsView(productModel: Get.arguments),
    ),
    GetPage(
      name: AppRoutes.kSearch,
      page: () => const SearchView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProductSearchController>(
          () => ProductSearchController(crud: Get.find<Crud>()),
        );
      }),
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
