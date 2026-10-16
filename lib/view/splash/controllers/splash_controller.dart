import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/services/auth_service.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/services/onboarding_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static const _splashDuration = Duration(seconds: 3);

  final AuthService _authService = Get.find<AuthService>();

  @override
  void onReady() {
    super.onReady();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    final routeFuture = _resolveRoute();
    await Future<void>.delayed(_splashDuration);
    Get.offAllNamed(await routeFuture);
  }

  Future<String> _resolveRoute() async {
    if (await _authService.isLoggedIn()) return AppRoutes.kBottomBar;

    final onboardingSeen = await OnboardingService.isSeen();
    return onboardingSeen ? AppRoutes.kSignin : AppRoutes.kOnBoarding;
  }
}
