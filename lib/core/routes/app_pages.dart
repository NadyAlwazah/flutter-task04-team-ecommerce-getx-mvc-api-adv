import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/my_order_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/my_order_screen/past_order_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/edite_profile_screen/edite_profile_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/profile_screens/peofile_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/splash/splash_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage<dynamic>> getPages = [
    GetPage(name: AppRoutes.kSplash, page: () => const SplashView()),
    GetPage(name: AppRoutes.kOrderHistoryAndTracking, page: () => const MyOrderScreen()),
    GetPage(name: AppRoutes.kProfile, page: () => const ProfileScreen()),
    GetPage(name: AppRoutes.kEditProfile, page: () => const EditeProfileScreen()),
    GetPage(name: AppRoutes.kPastOrders, page: () => const PastOrderScreen()),
  ];
}