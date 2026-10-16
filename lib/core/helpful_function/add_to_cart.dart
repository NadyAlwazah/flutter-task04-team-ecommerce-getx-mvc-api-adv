import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../widgets/app_action_dialog.dart';

Future<void> addToCart({required ProductModel product}) async {
  if (Get.find<CartController>().isInCart(product.id)) {
    Get.dialog(
      AppActionDialog(
        title: 'Already added to Cart',
        message: 'This product has already added to your cart',
        icon: Icons.warning_amber_outlined,
        product: product,
      ),
    );
  } else {
    final added = await Get.find<CartController>().addToCart(
      productId: product.id,
    );
    if (added) {
      Get.dialog(
        AppActionDialog(
          title: 'Added to cart',
          message: 'this product was added to cart ',
          icon: Icons.add_shopping_cart_outlined,
          product: product,
        ),
      );
    }
  }
}
