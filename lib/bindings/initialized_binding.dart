import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/controllers/my_order_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/profil_section/controller/profile_controller.dart';
import 'package:get/get.dart';

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Crud>(() => Crud(), fenix: true);
    Get.lazyPut<MyOrderController>(() => MyOrderController());
    Get.lazyPut<ProfileController>(() => ProfileController(),
);
  }
}
