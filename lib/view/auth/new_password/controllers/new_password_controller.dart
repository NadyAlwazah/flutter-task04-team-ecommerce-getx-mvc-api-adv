import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/auth/new_password/bindings/new_password_binding.dart';

import 'package:get/get.dart';

class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPasswordController>(() => NewPasswordController());
  }
}
