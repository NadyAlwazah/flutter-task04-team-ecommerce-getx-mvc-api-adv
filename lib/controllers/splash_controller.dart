import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static const _splashDuration = Duration(seconds: 3);

  @override
  void onReady() {
    super.onReady();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future<void>.delayed(_splashDuration);
    Get.offAllNamed(AppRoutes.kOnBoarding);
  }
}
