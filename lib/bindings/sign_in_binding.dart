import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/services/auth_service.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/sign_in/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService(), fenix: true);
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
