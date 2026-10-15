import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/styles.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';

class ProductPriceSection extends StatelessWidget {
  const ProductPriceSection({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\$${productModel.price}',
          style: Styles.textStyle24W500ClashDisplay.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),

        Text(
          '\$${productModel.price / 2}',
          style: Styles.textStyle16W500ClashDisplay.copyWith(
            color: AppColors.secondText,
            decoration: TextDecoration.lineThrough,
            decorationColor: AppColors.secondText,
          ),
        ),
      ],
    );
  }
}
