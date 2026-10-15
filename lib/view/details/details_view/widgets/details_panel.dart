import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/models/product_model.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/view/details/details_view/widgets/details_panel_body.dart';

class DetailsPanel extends StatelessWidget {
  const DetailsPanel({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 411.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(38.r)),
          ),
          child: DetailsPanelBody(productModel: productModel),
        ),
      ),
    );
  }
}
