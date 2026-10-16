
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final RxList<ProductModel> favoriteProducts = <ProductModel>[].obs;

  int selectedFilter = 0;

  final List<String> filters = [
    'All Items',
    'Outerwear',
    'Tops',
    'Footwear',
  ];

  bool isFavorite(ProductModel product) {
    return favoriteProducts.any(
      (item) => item.id == product.id,
    );
  }

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      removeFavorite(product);
    } else {
      favoriteProducts.add(product);
      update();
    }
  }

  void removeFavorite(ProductModel product) {
    favoriteProducts.removeWhere(
      (item) => item.id == product.id,
    );

    update();
  }

  void changeFilter(int index) {
    selectedFilter = index;
    update();
  }

  bool matchesFilter(ProductModel product, int filter) {
    if (filter == 0) return true;

    final title = product.title.toLowerCase();
    final slug = product.slug.toLowerCase();
    final category = product.category.name.toLowerCase();

    final text = '$title $slug $category';

    switch (filter) {
      case 1:
        return text.contains('coat') ||
            text.contains('jacket') ||
            text.contains('outerwear');

      case 2:
        return text.contains('shirt') ||
            text.contains('top') ||
            text.contains('sweater') ||
            text.contains('knit') ||
            text.contains('hoodie') ||
            text.contains('beanie');

      case 3:
        return text.contains('shoe') ||
            text.contains('loafer') ||
            text.contains('boot') ||
            text.contains('sneaker');

      default:
        return true;
    }
  }

  List<ProductModel> getFilteredProducts() {
    return favoriteProducts
        .where(
          (product) => matchesFilter(product, selectedFilter),
        )
        .toList();
  }

  int getFilterCount(int filter) {
    return favoriteProducts
        .where((product) => matchesFilter(product, filter))
        .length;
  }
}
