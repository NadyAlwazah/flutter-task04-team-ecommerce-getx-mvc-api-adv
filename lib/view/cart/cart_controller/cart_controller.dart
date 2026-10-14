import 'package:get/get.dart';

import '../../../core/constants/app_keys.dart';
import '../../../core/services/shared_preferences_helper.dart';

class CartController extends GetxController {
  List<String> cart = [];
  late final Future<void> _loadFuture;

  @override
  void onInit() {
    super.onInit();
    _loadFuture = _loadCart();
  }

  Future<void> _loadCart() async {
    final savedCart =
        await SharedPreferencesHelper.getList(AppKeys.kMyCart) ?? <String>[];

    cart.assignAll(savedCart);

    update();
  }

  Future<void> addToCart({required int productId}) async {
    await _loadFuture;

    cart.add(productId.toString());
    update();

    await SharedPreferencesHelper.saveList(AppKeys.kMyCart, cart);
  }

  Future<void> removeFromCart({required int productId}) async {
    await _loadFuture;

    cart.remove(productId.toString());
    update();

    await SharedPreferencesHelper.saveList(AppKeys.kMyCart, cart);
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
