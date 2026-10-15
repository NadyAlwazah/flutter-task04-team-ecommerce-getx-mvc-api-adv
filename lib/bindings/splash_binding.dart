import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
