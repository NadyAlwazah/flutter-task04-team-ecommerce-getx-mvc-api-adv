import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // put وليس lazyPut: الـ View لا تقرأ الـ Controller،
    // لكن onReady يجب أن يعمل ليبدأ المؤقت.
    Get.put(SplashController());
  }
}
