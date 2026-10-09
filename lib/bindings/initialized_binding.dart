import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:get/get.dart';

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Crud>(() => Crud(), fenix: true);
  }
}
