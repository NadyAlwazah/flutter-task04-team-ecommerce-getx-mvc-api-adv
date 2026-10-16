/*
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
*/

import 'dart:convert';

import 'package:get/get.dart';

import '../../../controllers/products_controller.dart';
import '../../../core/constants/app_keys.dart';
import '../../../core/services/shared_preferences_helper.dart';
import '../../../models/product_model.dart';

class CartController extends GetxController {
  final RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
  final RxList<ProductModel> productsInCart = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  Future<void> loadCart() async {
    final savedCart = await SharedPreferencesHelper.getList(AppKeys.kMyCart);

    cartItems.assignAll(
      (savedCart ?? <String>[])
          .map((item) => Map<String, dynamic>.from(jsonDecode(item) as Map))
          .toList(),
    );

    await _loadCartProducts();
  }

  Future<void> _loadCartProducts() async {
    final productsController = Get.find<ProductsController>();

    await productsController.getProducts();

    final allProducts = productsController.allProducts;
    final ids = cartItems.map((item) => item['productId'] as int).toSet();

    productsInCart.assignAll(
      allProducts.where((product) => ids.contains(product.id)),
    );
  }

  Future<void> _saveCart() async {
    final savedCart = cartItems.map((item) => jsonEncode(item)).toList();

    await SharedPreferencesHelper.saveList(AppKeys.kMyCart, savedCart);
  }

  Future<bool> addToCart({required int productId, required String size}) async {
    final existingIndex = cartItems.indexWhere(
      (item) => item['productId'] == productId && item['size'] == size,
    );

    if (existingIndex != -1) {
      return false;
    }

    cartItems.add({'productId': productId, 'size': size, 'quantity': 1});

    final productsController = Get.find<ProductsController>();
    final alreadyLoaded = productsController.allProducts.any(
      (product) => product.id == productId,
    );

    if (!alreadyLoaded) {
      await productsController.getProducts();
    }

    final product = productsController.allProducts.firstWhereOrNull(
      (product) => product.id == productId,
    );

    if (product != null &&
        !productsInCart.any((item) => item.id == productId)) {
      productsInCart.add(product);
    }

    await _saveCart();
    return true;
  }

  Future<bool> removeFromCart({
    required int productId,
    required String size,
  }) async {
    final initialLength = cartItems.length;

    cartItems.removeWhere(
      (item) => item['productId'] == productId && item['size'] == size,
    );

    if (cartItems.length == initialLength) {
      return false;
    }

    final hasOtherSizes = cartItems.any(
      (item) => item['productId'] == productId,
    );

    if (!hasOtherSizes) {
      productsInCart.removeWhere((product) => product.id == productId);
    }

    await _saveCart();
    return true;
  }

  bool isInCart({required int productId, required String size}) {
    return cartItems.any(
      (item) => item['productId'] == productId && item['size'] == size,
    );
  }

  Future<void> increaseQuantity(int index) async {
    cartItems[index]['quantity'] = (cartItems[index]['quantity'] as int) + 1;

    cartItems.refresh();
    await _saveCart();
  }

  Future<void> decreaseQuantity(int index) async {
    final quantity = cartItems[index]['quantity'] as int;

    if (quantity <= 1) return;

    cartItems[index]['quantity'] = quantity - 1;

    cartItems.refresh();
    await _saveCart();
  }

  ProductModel? getProductById(int productId) {
    return productsInCart.firstWhereOrNull(
      (product) => product.id == productId,
    );
  }

  int getQuantity(int index) {
    return cartItems[index]['quantity'] as int;
  }

  String getSize(int index) {
    return cartItems[index]['size'] as String;
  }

  int getProductId(int index) {
    return cartItems[index]['productId'] as int;
  }
}
