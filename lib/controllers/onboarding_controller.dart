import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/services/onboarding_service.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  Future<void> onGetStarted() async {
    await OnboardingService.markSeen();
    Get.offAllNamed(AppRoutes.kSignin);
  }
}
