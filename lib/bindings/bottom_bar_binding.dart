import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/products_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/wishlist_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/home/controllers/categories_controller.dart';
import 'package:get/get.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(() => BottomBarController());

    Get.lazyPut<CategoriesController>(
      () => CategoriesController(crud: Get.find<Crud>()),
    );

    Get.lazyPut<ProductsController>(
      () => ProductsController(crud: Get.find<Crud>()),
    );
    Get.lazyPut<WishlistController>(() => WishlistController());
  }
}
