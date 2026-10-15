import 'package:flutter/widgets.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/bottom_bar_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_view/bottom_bar_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/notifaction_section/notification_screen/notifiction_screen.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/payment&addres_section/address_screen/address_and_payment.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/splash/splash_view.dart';
import 'package:get/get.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/notification_binding.dart';

class AppPages {
  static final List<GetPage<dynamic>> getPages = [
    GetPage(name: AppRoutes.kSplash, page: () => const SplashView()),

    GetPage(
      name: AppRoutes.kBottomBar,
      page: () => const BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
  name: AppRoutes.kNotifications,
  page: () =>  NotifictionScreen(),
  binding: NotificationBinding(),
),
GetPage(
  name: AppRoutes.kAddressAndPayment,
  page: () => AddressAndPaymentScreen(),
),





  ];
}
