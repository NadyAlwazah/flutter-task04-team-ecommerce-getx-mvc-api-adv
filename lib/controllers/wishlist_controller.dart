import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/controllers/products_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/classes/status_class.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:get/get.dart';

import '../core/constants/app_keys.dart';
import '../core/services/shared_preferences_helper.dart';

class WishlistController extends GetxController {
  StatusClass status = StatusClass.init;

  final RxList<String> wishlistIds = <String>[].obs;
  final RxList<ProductModel> wishlistItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeWishlist();
  }

  Future<void> initializeWishlist() async {
    await loadWishlist();

    final productsController = Get.find<ProductsController>();
    await productsController.getProducts();

    await loadWishlistItems();
  }

  Future<void> loadWishlist() async {
    final savedIds = await SharedPreferencesHelper.getList(
      AppKeys.kWishlistIds,
    );

    wishlistIds.assignAll(savedIds ?? <String>[]);
  }

  Future<void> loadWishlistItems() async {
    status = StatusClass.isLoading;

    final List<ProductModel> items = Get.find<ProductsController>().allProducts;

    final Set<String> ids = wishlistIds.toSet();

    wishlistItems.clear();

    for (final item in items) {
      if (ids.contains(item.id.toString())) {
        wishlistItems.add(item);
      }
    }

    status = wishlistItems.isNotEmpty
        ? StatusClass.success
        : StatusClass.noData;
  }

  Future<bool> toggleWishlist(int productId) async {
    final id = productId.toString();
    final isAdding = !wishlistIds.contains(id);

    if (isAdding) {
      wishlistIds.add(id);

      final products = Get.find<ProductsController>().allProducts;

      for (final product in products) {
        if (product.id == productId) {
          if (!wishlistItems.any((item) => item.id == productId)) {
            wishlistItems.add(product);
          }
          break;
        }
      }
    } else {
      wishlistIds.remove(id);

      wishlistItems.removeWhere((product) => product.id == productId);
    }

    status = wishlistItems.isNotEmpty
        ? StatusClass.success
        : StatusClass.noData;

    await SharedPreferencesHelper.saveList(
      AppKeys.kWishlistIds,
      wishlistIds.toList(),
    );

    return isAdding;
  }

  bool isWishlisted(int productId) {
    return wishlistIds.contains(productId.toString());
  }
}
