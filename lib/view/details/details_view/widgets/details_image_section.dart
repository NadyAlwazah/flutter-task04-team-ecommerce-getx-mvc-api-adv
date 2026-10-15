import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/details_top_buttons.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/widgets/app_loader.dart';

class DetailsImageSection extends StatelessWidget {
  const DetailsImageSection({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl: productModel.images.first,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(child: AppLoader()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error, color: Colors.white)),
          ),
        ),
        DetailsTopButtons(productModel: productModel),
      ],
    );
  }
}
