import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/bottom_bar_binding.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/crud.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/routes/app_routes.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/bottom_bar/bottom_bar_view/bottom_bar_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/details_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/search/search_controller/product_search_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/search/search_view/search_view.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/splash/splash_view.dart';
import 'package:get/get.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/bindings/splash_binding.dart';

class AppPages {
  static final List<GetPage<dynamic>> getPages = [
    GetPage(
      name: AppRoutes.kSplash,
      page: () => const SplashView(),
      binding: SplashBinding(),

    GetPage(
      name: AppRoutes.kBottomBar,
      page: () => const BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: AppRoutes.kDetails,
      page: () => DetailsView(productModel: Get.arguments),
    ),
    GetPage(
      name: AppRoutes.kSearch,
      page: () => const SearchView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProductSearchController>(
          () => ProductSearchController(crud: Get.find<Crud>()),
        );
      }),
    ),
  ];
}
