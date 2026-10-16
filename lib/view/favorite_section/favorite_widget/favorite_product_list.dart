
import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_controller/favorite_controller.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/favorite_section/favorite_widget/favorite_card.dart';

class FavoriteProductList extends StatelessWidget {
  const FavoriteProductList({
    super.key,
    required this.products,
    required this.controller,
  });

  final List<ProductModel> products;
  final FavoriteController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return FavoriteProductCard(
          product: product,
          hasDiscount: index == 0 || index == 2,
          onRemove: () => controller.removeFavorite(product),
        );
      },
    );
  }
}
