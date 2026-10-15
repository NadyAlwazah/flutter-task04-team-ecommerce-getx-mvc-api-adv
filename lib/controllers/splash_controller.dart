import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/services/onboarding_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static const _splashDuration = Duration(seconds: 5);

  @override
  void onReady() {
    super.onReady();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future<void>.delayed(_splashDuration);
    final seen = await OnboardingService.isSeen();
    Get.offAllNamed(seen ? AppRoutes.kSignin : AppRoutes.kOnBoarding);
  }
}
