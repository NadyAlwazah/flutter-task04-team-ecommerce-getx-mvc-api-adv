import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/cart_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/services/auth_service.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_controller/favorite_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/my_order/controllers/my_order_controller.dart';
import 'package:get/get.dart';

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Crud>(() => Crud(), fenix: true);

    Get.lazyPut<CartController>(() => CartController(), fenix: true);

    Get.lazyPut<MyOrderController>(() => MyOrderController());
    Get.put(AuthService());
    Get.lazyPut<FavoriteController>(() => FavoriteController(), fenix: true);
  }
}
