import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final RxList<ProductModel> favoriteProducts = <ProductModel>[].obs;

  bool isFavorite(ProductModel product) {
    return favoriteProducts.any(
      (item) => item.id == product.id,
    );
  }

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      favoriteProducts.removeWhere(
        (item) => item.id == product.id,
      );
    } else {
      favoriteProducts.add(product);
    }

    update();
  }

  void removeFavorite(ProductModel product) {
    favoriteProducts.removeWhere(
      (item) => item.id == product.id,
    );

    update();
  }
}