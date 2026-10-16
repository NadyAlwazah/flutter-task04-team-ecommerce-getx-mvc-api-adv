import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';

class CartItemModel {
  final int productId;
  final String size;
  final int quantity;

  CartItemModel({
    required this.productId,
    required this.quantity,
    required this.size,
  });
}
