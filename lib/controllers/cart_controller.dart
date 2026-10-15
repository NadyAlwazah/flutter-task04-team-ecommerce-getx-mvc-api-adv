import 'package:get/get.dart';

import '../../../controllers/products_controller.dart';
import '../../../core/constants/app_keys.dart';
import '../../../core/services/shared_preferences_helper.dart';
import '../../../models/product_model.dart';

class CartController extends GetxController {
  final RxList<String> cart = <String>[].obs;
  final RxList<ProductModel> cartItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadCart();
  }

  Future<void> _loadCart() async {
    final savedCart =
        await SharedPreferencesHelper.getList(AppKeys.kMyCart) ?? <String>[];

    cart.assignAll(savedCart);

    final productsController = Get.find<ProductsController>();

    await productsController.getProducts();

    final products = productsController.allProducts;
    final cartIds = cart.toSet();

    cartItems.assignAll(
      products.where((product) => cartIds.contains(product.id.toString())),
    );
  }

  Future<bool> addToCart({required int productId}) async {
    final id = productId.toString();

    // منع إضافة المنتج نفسه أكثر من مرة
    if (cart.contains(id)) {
      return false;
    }

    cart.add(id);

    final products = Get.find<ProductsController>().allProducts;

    for (final product in products) {
      if (product.id == productId) {
        cartItems.add(product);
        break;
      }
    }

    await SharedPreferencesHelper.saveList(AppKeys.kMyCart, cart.toList());

    return true;
  }

  Future<bool> removeFromCart({required int productId}) async {
    final id = productId.toString();

    if (!cart.contains(id)) {
      return false;
    }

    cart.remove(id);

    cartItems.removeWhere((product) => product.id == productId);

    await SharedPreferencesHelper.saveList(AppKeys.kMyCart, cart.toList());

    return true;
  }

  bool isInCart(int productId) {
    return cart.contains(productId.toString());
  }

  int quantity = 1;

  void increaseQuantity() {
    quantity++;
    update();
  }

  void decreaseQuantity() {
    quantity--;
    update();
  }
}
