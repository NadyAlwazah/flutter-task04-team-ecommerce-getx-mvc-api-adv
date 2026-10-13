import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/details_image_section.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/details_thumbnails_list.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DetailsImageSection(productModel: productModel),
        DetailsThumbnailsList(productModel: productModel),
      ],
    );
  }
}
